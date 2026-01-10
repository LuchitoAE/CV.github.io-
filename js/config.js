// Configuración global de la aplicación
export const CONFIG = {
    // Información personal
    PERSONAL_INFO: {
        name: "AQUINO ESPINOZA Luis Walter",
        shortName: "AQUINO Luis",
        location: "Huancayo, Junín - Perú",
        university: "Universidad Peruana Los Andes",
        graduationDate: "27 de agosto de 2027",
        email: "laquinoluis07@gmail.com",
        phone: "+51 921 820 220",
        github: "https://github.com/laquinoluis07",
        linkedin: "https://linkedin.com/in/laquinoluis07"
    },

    // Configuración de tema
    THEME: {
        default: 'light',
        storageKey: 'cv-theme',
        classes: {
            light: 'light-theme',
            dark: 'dark-theme'
        }
    },

    // Configuración de idioma
    LANGUAGE: {
        default: 'es',
        storageKey: 'cv-language',
        supported: ['es', 'en']
    },

    // Rutas de archivos
    PATHS: {
        translations: 'assets/translations/'
    },

    // Configuración del PDF
    PDF: {
        fileName: 'CV_AQUINO_Luis.pdf',
        printDelay: 300 // ms antes de abrir diálogo de impresión
    }
};

// Exportar funciones de utilidad
export function getStorageItem(key, defaultValue) {
    try {
        const item = localStorage.getItem(key);
        return item ? JSON.parse(item) : defaultValue;
    } catch {
        return defaultValue;
    }
}

export function setStorageItem(key, value) {
    try {
        localStorage.setItem(key, JSON.stringify(value));
        return true;
    } catch {
        return false;
    }
}

// Detectar preferencias del sistema
export function detectSystemPreferences() {
    const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
    const systemTheme = prefersDark ? 'dark' : 'light';
    
    const userLang = navigator.language || navigator.userLanguage;
    const systemLang = userLang.startsWith('es') ? 'es' : 'en';
    
    return {
        theme: systemTheme,
        language: systemLang
    };
}