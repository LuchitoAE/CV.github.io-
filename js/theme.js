import { CONFIG, getStorageItem, setStorageItem } from './config.js';

class ThemeManager {
    constructor() {
        this.currentTheme = CONFIG.THEME.default;
        this.themeToggle = document.getElementById('themeToggle');
        this.initialized = false;
    }

    init() {
        try {
            // Cargar tema guardado o detectar preferencias del sistema
            const savedTheme = getStorageItem(CONFIG.THEME.storageKey, null);
            const systemPrefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
            
            if (savedTheme) {
                this.currentTheme = savedTheme;
            } else if (systemPrefersDark) {
                this.currentTheme = 'dark';
            }

            // Aplicar tema inicial
            this.applyTheme(this.currentTheme);
            
            // Configurar event listeners
            this.setupEventListeners();
            
            // Configurar Media Query Listener
            this.setupMediaQueryListener();
            
            this.initialized = true;
            console.log(`Theme initialized: ${this.currentTheme}`);
            
        } catch (error) {
            console.error('Error initializing theme:', error);
            this.currentTheme = CONFIG.THEME.default;
            this.applyTheme(this.currentTheme);
        }
    }

    applyTheme(theme) {
        // Validar tema
        const validTheme = theme === 'dark' ? 'dark' : 'light';
        
        // Actualizar atributo data-theme
        document.documentElement.setAttribute('data-theme', validTheme);
        
        // Actualizar tema actual
        this.currentTheme = validTheme;
        
        // Guardar preferencia
        setStorageItem(CONFIG.THEME.storageKey, validTheme);
        
        // Actualizar ícono del botón
        this.updateToggleIcon();
        
        // Disparar evento personalizado
        document.dispatchEvent(new CustomEvent('themeChanged', {
            detail: { theme: validTheme }
        }));
    }

    toggleTheme() {
        const newTheme = this.currentTheme === 'light' ? 'dark' : 'light';
        this.applyTheme(newTheme);
    }

    updateToggleIcon() {
        if (!this.themeToggle) return;
        
        const icons = this.themeToggle.querySelectorAll('i');
        if (this.currentTheme === 'dark') {
            icons[0].style.display = 'none';
            icons[1].style.display = 'block';
            this.themeToggle.setAttribute('aria-label', 'Cambiar a modo claro');
        } else {
            icons[0].style.display = 'block';
            icons[1].style.display = 'none';
            this.themeToggle.setAttribute('aria-label', 'Cambiar a modo oscuro');
        }
    }

    setupEventListeners() {
        // Toggle del botón
        if (this.themeToggle) {
            this.themeToggle.addEventListener('click', () => this.toggleTheme());
        }
        
        // Soporte para teclado
        if (this.themeToggle) {
            this.themeToggle.addEventListener('keydown', (e) => {
                if (e.key === 'Enter' || e.key === ' ') {
                    e.preventDefault();
                    this.toggleTheme();
                }
            });
        }
    }

    setupMediaQueryListener() {
        const mediaQuery = window.matchMedia('(prefers-color-scheme: dark)');
        
        const handleChange = (e) => {
            // Solo cambiar si no hay preferencia guardada
            const savedTheme = getStorageItem(CONFIG.THEME.storageKey, null);
            if (!savedTheme) {
                const newTheme = e.matches ? 'dark' : 'light';
                this.applyTheme(newTheme);
            }
        };
        
        // Escuchar cambios
        if (mediaQuery.addEventListener) {
            mediaQuery.addEventListener('change', handleChange);
        } else {
            mediaQuery.addListener(handleChange);
        }
    }

    // Métodos públicos
    getCurrentTheme() {
        return this.currentTheme;
    }

    setTheme(theme) {
        if (theme === 'light' || theme === 'dark') {
            this.applyTheme(theme);
        }
    }
}

// Crear instancia global
const themeManager = new ThemeManager();

// Inicializar cuando el DOM esté listo
document.addEventListener('DOMContentLoaded', () => {
    themeManager.init();
});

// Exportar para uso en otros módulos
export { themeManager };