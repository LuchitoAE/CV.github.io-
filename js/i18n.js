import { CONFIG, getStorageItem, setStorageItem } from './config.js';

class Internationalization {
    constructor() {
        this.currentLang = CONFIG.LANGUAGE.default;
        this.translations = {};
        this.initialized = false;
    }

    async init() {
        try {
            // Cargar idioma guardado o detectar preferencias
            const savedLang = getStorageItem(CONFIG.LANGUAGE.storageKey, null);
            
            if (savedLang && CONFIG.LANGUAGE.supported.includes(savedLang)) {
                this.currentLang = savedLang;
            } else {
                // Detectar idioma del navegador
                const browserLang = navigator.language.split('-')[0];
                this.currentLang = CONFIG.LANGUAGE.supported.includes(browserLang) 
                    ? browserLang 
                    : CONFIG.LANGUAGE.default;
            }

            // Cargar traducciones
            await this.loadTranslations();
            
            // Aplicar idioma inicial
            await this.applyLanguage(this.currentLang);
            
            this.initialized = true;
            console.log(`i18n initialized with language: ${this.currentLang}`);
            
        } catch (error) {
            console.error('Error initializing i18n:', error);
            // Usar idioma por defecto en caso de error
            this.currentLang = CONFIG.LANGUAGE.default;
            this.translations[this.currentLang] = {};
            await this.applyLanguage(this.currentLang);
        }
    }

    async loadTranslations() {
        const promises = CONFIG.LANGUAGE.supported.map(async (lang) => {
            try {
                const response = await fetch(`${CONFIG.PATHS.translations}${lang}.json`);
                if (!response.ok) throw new Error(`HTTP ${response.status}`);
                
                this.translations[lang] = await response.json();
            } catch (error) {
                console.error(`Failed to load ${lang} translations:`, error);
                this.translations[lang] = {};
            }
        });

        await Promise.all(promises);
    }

    async applyLanguage(lang) {
        if (!this.translations[lang]) {
            console.warn(`Translations for ${lang} not found`);
            return;
        }

        this.currentLang = lang;
        
        // Actualizar atributo lang del HTML
        document.documentElement.lang = lang;
        
        // Actualizar todos los elementos con data-i18n
        this.updatePageText();
        
        // Actualizar botones de idioma activo
        this.updateLanguageButtons();
        
        // Guardar preferencia
        setStorageItem(CONFIG.LANGUAGE.storageKey, lang);
        
        // Disparar evento personalizado
        document.dispatchEvent(new CustomEvent('languageChanged', {
            detail: { language: lang }
        }));
    }

    updatePageText() {
        const elements = document.querySelectorAll('[data-i18n]');
        
        elements.forEach(element => {
            const key = element.getAttribute('data-i18n');
            const translation = this.getTranslation(key);
            
            if (translation !== undefined) {
                if (element.tagName === 'INPUT' || element.tagName === 'TEXTAREA') {
                    element.placeholder = translation;
                } else if (element.hasAttribute('aria-label')) {
                    element.setAttribute('aria-label', translation);
                } else if (element.hasAttribute('title')) {
                    element.setAttribute('title', translation);
                } else {
                    element.textContent = translation;
                }
            } else {
                console.warn(`Translation key "${key}" not found for language ${this.currentLang}`);
            }
        });
    }

    updateLanguageButtons() {
        document.querySelectorAll('.lang-btn').forEach(button => {
            const lang = button.getAttribute('data-lang');
            
            if (lang === this.currentLang) {
                button.classList.add('active');
                button.setAttribute('aria-current', 'language');
            } else {
                button.classList.remove('active');
                button.removeAttribute('aria-current');
            }
        });
    }

    getTranslation(key) {
        // Buscar traducción recursivamente usando notación de puntos
        const keys = key.split('.');
        let value = this.translations[this.currentLang];
        
        for (const k of keys) {
            if (value && typeof value === 'object' && k in value) {
                value = value[k];
            } else {
                return undefined;
            }
        }
        
        return value;
    }

    // Método para cambiar idioma manualmente
    changeLanguage(lang) {
        if (CONFIG.LANGUAGE.supported.includes(lang) && lang !== this.currentLang) {
            this.applyLanguage(lang);
        }
    }

    // Obtener idioma actual
    getCurrentLanguage() {
        return this.currentLang;
    }

    // Verificar si un idioma está soportado
    isLanguageSupported(lang) {
        return CONFIG.LANGUAGE.supported.includes(lang);
    }
}

// Crear instancia global
const i18n = new Internationalization();

// Inicializar cuando el DOM esté listo
document.addEventListener('DOMContentLoaded', () => {
    i18n.init().then(() => {
        // Configurar event listeners para botones de idioma
        document.querySelectorAll('.lang-btn').forEach(button => {
            button.addEventListener('click', (e) => {
                e.preventDefault();
                const lang = button.getAttribute('data-lang');
                i18n.changeLanguage(lang);
            });
        });
    });
});

// Exportar para uso en otros módulos
export { i18n };