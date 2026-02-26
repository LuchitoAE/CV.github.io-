import { CONFIG } from './config.js';
import { i18n } from './i18n.js';
import { themeManager } from './theme.js';

class CVApplication {
    constructor() {
        this.isInitialized = false;
        this.scrollPosition = 0;
        this.menuOpen = false;
        
        // Elementos DOM
        this.menuToggle = document.getElementById('menuToggle');
        this.navbarMenu = document.querySelector('.navbar-menu');
        this.backToTop = document.getElementById('backToTop');
        this.downloadPDF = document.getElementById('downloadPDF');
        this.contactForm = document.getElementById('contactForm');
    }

    async init() {
        if (this.isInitialized) return;
        
        try {
            // Inicializar componentes
            this.setupEventListeners();
            this.setupSmoothScroll();
            this.setupBackToTop();
            this.setupMobileMenu();
            this.setupFormValidation();
            this.setupPrintFunctionality();
            
            // Inicializar animaciones
            this.initAnimations();
            
            // Cargar datos adicionales si es necesario
            await this.loadAdditionalData();
            
            this.isInitialized = true;
            console.log('CV Application initialized successfully');
            
        } catch (error) {
            console.error('Error initializing application:', error);
        }
    }

    setupEventListeners() {
        // Menú móvil
        if (this.menuToggle) {
            this.menuToggle.addEventListener('click', () => this.toggleMobileMenu());
        }

        // Cerrar menú al hacer clic en enlace
        document.querySelectorAll('.navbar-menu a').forEach(link => {
            link.addEventListener('click', () => this.closeMobileMenu());
        });

        // Descargar PDF
        if (this.downloadPDF) {
            this.downloadPDF.addEventListener('click', (e) => {
                e.preventDefault();
                this.generatePDF();
            });
        }

        // Formulario de contacto
        if (this.contactForm) {
            this.contactForm.addEventListener('submit', (e) => this.handleFormSubmit(e));
        }

        // Cerrar menú al hacer clic fuera
        document.addEventListener('click', (e) => {
            if (this.menuOpen && 
                !this.navbarMenu.contains(e.target) && 
                !this.menuToggle.contains(e.target)) {
                this.closeMobileMenu();
            }
        });

        // Escuchar cambios de tema e idioma
        document.addEventListener('themeChanged', (e) => {
            console.log('Theme changed to:', e.detail.theme);
        });

        document.addEventListener('languageChanged', (e) => {
            console.log('Language changed to:', e.detail.language);
            this.updateDownloadButtonText();
        });

        // Prevenir envío de formulario con Enter en campos no deseados
        document.addEventListener('keydown', (e) => {
            if (e.key === 'Enter' && e.target.tagName !== 'TEXTAREA') {
                if (e.target.type !== 'submit' && !e.target.closest('form')) {
                    e.preventDefault();
                }
            }
        });
    }

    setupSmoothScroll() {
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', (e) => {
                const href = anchor.getAttribute('href');
                
                if (href === '#') return;
                
                e.preventDefault();
                const targetElement = document.querySelector(href);
                
                if (targetElement) {
                    const headerHeight = document.querySelector('.header').offsetHeight;
                    const targetPosition = targetElement.offsetTop - headerHeight;
                    
                    window.scrollTo({
                        top: targetPosition,
                        behavior: 'smooth'
                    });
                }
            });
        });
    }

    setupBackToTop() {
        if (!this.backToTop) return;
        
        const showBackToTop = () => {
            if (window.scrollY > 300) {
                this.backToTop.classList.add('visible');
            } else {
                this.backToTop.classList.remove('visible');
            }
        };
        
        window.addEventListener('scroll', showBackToTop);
        
        this.backToTop.addEventListener('click', () => {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        });
        
        // Mostrar/ocultar inicialmente
        showBackToTop();
    }

    setupMobileMenu() {
        if (!this.menuToggle || !this.navbarMenu) return;
        
        // Cerrar menú al cambiar tamaño de ventana
        window.addEventListener('resize', () => {
            if (window.innerWidth > 767) {
                this.closeMobileMenu();
            }
        });
    }

    toggleMobileMenu() {
        this.menuOpen = !this.menuOpen;
        this.navbarMenu.classList.toggle('active');
        this.menuToggle.setAttribute('aria-expanded', this.menuOpen);
        
        // Cambiar ícono
        const icon = this.menuToggle.querySelector('i');
        if (this.menuOpen) {
            icon.classList.remove('fa-bars');
            icon.classList.add('fa-times');
        } else {
            icon.classList.remove('fa-times');
            icon.classList.add('fa-bars');
        }
    }

    closeMobileMenu() {
        if (this.menuOpen) {
            this.menuOpen = false;
            this.navbarMenu.classList.remove('active');
            this.menuToggle.setAttribute('aria-expanded', 'false');
            
            const icon = this.menuToggle.querySelector('i');
            icon.classList.remove('fa-times');
            icon.classList.add('fa-bars');
        }
    }

    setupFormValidation() {
        if (!this.contactForm) return;
        
        const inputs = this.contactForm.querySelectorAll('input, textarea');
        
        inputs.forEach(input => {
            // Validación en tiempo real
            input.addEventListener('blur', () => this.validateField(input));
            input.addEventListener('input', () => this.clearFieldError(input));
        });
    }

    validateField(field) {
        const value = field.value.trim();
        let isValid = true;
        let errorMessage = '';
        
        if (field.required && !value) {
            isValid = false;
            errorMessage = i18n.getTranslation('fieldRequired') || 'Este campo es requerido';
        } else if (field.type === 'email' && value) {
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(value)) {
                isValid = false;
                errorMessage = i18n.getTranslation('invalidEmail') || 'Email inválido';
            }
        }
        
        if (!isValid) {
            this.showFieldError(field, errorMessage);
        } else {
            this.clearFieldError(field);
        }
        
        return isValid;
    }

    showFieldError(field, message) {
        this.clearFieldError(field);
        
        field.classList.add('error');
        
        const errorElement = document.createElement('div');
        errorElement.className = 'field-error';
        errorElement.textContent = message;
        errorElement.setAttribute('role', 'alert');
        
        field.parentNode.appendChild(errorElement);
    }

    clearFieldError(field) {
        field.classList.remove('error');
        
        const existingError = field.parentNode.querySelector('.field-error');
        if (existingError) {
            existingError.remove();
        }
    }

    async handleFormSubmit(e) {
        e.preventDefault();
        
        if (!this.contactForm) return;
        
        // Validar todos los campos
        const fields = this.contactForm.querySelectorAll('input, textarea');
        let isValid = true;
        
        fields.forEach(field => {
            if (!this.validateField(field)) {
                isValid = false;
            }
        });
        
        if (!isValid) {
            // Enfocar el primer campo con error
            const firstError = this.contactForm.querySelector('.error');
            if (firstError) {
                firstError.focus();
            }
            return;
        }
        
        // Simular envío (en un proyecto real, aquí iría una petición fetch)
        try {
            const formData = new FormData(this.contactForm);
            const data = Object.fromEntries(formData);
            
            console.log('Form data:', data);
            
            // Mostrar mensaje de éxito
            this.showFormMessage(
                i18n.getTranslation('formSuccess') || '¡Mensaje enviado con éxito!',
                'success'
            );
            
            // Limpiar formulario
            this.contactForm.reset();
            
        } catch (error) {
            console.error('Error sending form:', error);
            this.showFormMessage(
                i18n.getTranslation('formError') || 'Error al enviar el mensaje. Intenta nuevamente.',
                'error'
            );
        }
    }

    showFormMessage(message, type) {
        // Eliminar mensajes existentes
        const existingMessage = document.querySelector('.form-message');
        if (existingMessage) {
            existingMessage.remove();
        }
        
        // Crear nuevo mensaje
        const messageElement = document.createElement('div');
        messageElement.className = `form-message form-message-${type}`;
        messageElement.textContent = message;
        messageElement.setAttribute('role', 'alert');
        
        // Insertar antes del formulario
        this.contactForm.parentNode.insertBefore(messageElement, this.contactForm);
        
        // Remover automáticamente después de 5 segundos
        setTimeout(() => {
            if (messageElement.parentNode) {
                messageElement.remove();
            }
        }, 5000);
    }

    setupPrintFunctionality() {
        // Configurar impresión/PDF
        window.addEventListener('beforeprint', () => {
            // Guardar tema actual
            this.scrollPosition = window.scrollY;
            document.body.classList.add('printing');
        });
        
        window.addEventListener('afterprint', () => {
            // Restaurar tema
            document.body.classList.remove('printing');
            window.scrollTo(0, this.scrollPosition);
        });
    }

    generatePDF() {
        const currentLang = i18n.getCurrentLanguage();
        const cvFile = currentLang === 'en' ? 'cv-en.html' : 'cv-es.html';
        window.open(cvFile, '_blank');
    }

    updateDownloadButtonText() {
        const button = this.downloadPDF;
        if (!button) return;
        
        const textSpan = button.querySelector('span[data-i18n="download"]');
        if (textSpan) {
            // La internacionalización ya actualiza el texto automáticamente
            // Solo necesitamos asegurarnos de que el ícono esté visible
            const icon = button.querySelector('i');
            if (icon) {
                icon.style.display = 'inline-block';
            }
        }
    }

    initAnimations() {
        // Animar barras de habilidad al hacer scroll
        this.animateSkillBars();
        
        // Configurar Intersection Observer para animaciones
        this.setupIntersectionObserver();
    }

    animateSkillBars() {
        const skillBars = document.querySelectorAll('.skill-level');
        
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const skillBar = entry.target;
                    const width = skillBar.style.width;
                    
                    // Reiniciar animación
                    skillBar.style.width = '0%';
                    
                    // Animar después de un pequeño delay
                    setTimeout(() => {
                        skillBar.style.width = width;
                    }, 100);
                    
                    observer.unobserve(skillBar);
                }
            });
        }, {
            threshold: 0.5
        });
        
        skillBars.forEach(bar => observer.observe(bar));
    }

    setupIntersectionObserver() {
        const elements = document.querySelectorAll('.about-card, .project-card, .timeline-content');
        
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('animate-in');
                }
            });
        }, {
            threshold: 0.1,
            rootMargin: '0px 0px -50px 0px'
        });
        
        elements.forEach(el => observer.observe(el));
    }

    async loadAdditionalData() {
        // Aquí podrías cargar datos adicionales desde APIs
        // Por ejemplo, últimos proyectos de GitHub, etc.
        
        // Ejemplo:
        // try {
        //     const response = await fetch('https://api.github.com/users/tu-usuario/repos');
        //     const repos = await response.json();
        //     this.updateProjects(repos);
        // } catch (error) {
        //     console.error('Error loading GitHub data:', error);
        // }
    }

    // Métodos utilitarios
    debounce(func, wait) {
        let timeout;
        return function executedFunction(...args) {
            const later = () => {
                clearTimeout(timeout);
                func(...args);
            };
            clearTimeout(timeout);
            timeout = setTimeout(later, wait);
        };
    }

    throttle(func, limit) {
        let inThrottle;
        return function() {
            const args = arguments;
            const context = this;
            if (!inThrottle) {
                func.apply(context, args);
                inThrottle = true;
                setTimeout(() => inThrottle = false, limit);
            }
        };
    }
}

// Crear instancia global
const app = new CVApplication();

// Inicializar cuando el DOM esté listo
document.addEventListener('DOMContentLoaded', () => {
    app.init();
});

// Exportar para uso en otros módulos (si es necesario)
export { app };