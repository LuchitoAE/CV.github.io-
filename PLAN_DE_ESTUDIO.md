# Plan de Estudio: AI Agent Engineer

> Roadmap personalizado para Luis Aquino
> Desde tu base actual (Java, JS, web dev) hacia AI Agent Engineer
> Fecha de inicio: Febrero 2026

---

## Fase 0: Fundamentos de Python (Semanas 1-3)

**Objetivo:** Dominar Python al nivel necesario para trabajar con IA.

**Tu base actual te ayuda:** Ya sabes programar en Java y JS, asi que no partes de cero. Python es mas simple en sintaxis.

### Que estudiar:
- [ ] Sintaxis basica de Python (variables, funciones, clases)
- [ ] Estructuras de datos: listas, diccionarios, sets, tuplas
- [ ] Manejo de archivos y JSON
- [ ] Entornos virtuales (venv, pip)
- [ ] List comprehensions, decoradores, generadores
- [ ] Modulos: os, sys, requests, json, pathlib

### Recursos:
- **Python Crash Course** (libro) - Capitulos 1-11
- **Automate the Boring Stuff with Python** (gratis online)
- **freeCodeCamp Python** en YouTube (4 horas)

### Proyecto practico:
- Crear un script que lea un archivo JSON, procese datos y genere un reporte
- Crear una CLI simple que interactue con una API publica

### Criterio de avance:
Puedes escribir un script de 200+ lineas sin buscar sintaxis basica.

---

## Fase 1: APIs y LLMs - Tu primer agente (Semanas 4-6)

**Objetivo:** Entender como funcionan los LLMs y crear tu primer agente basico.

### Que estudiar:
- [ ] Que es un LLM, como funciona (tokens, contexto, temperatura)
- [ ] APIs de modelos: OpenAI API, Anthropic API (Claude)
- [ ] Ollama: instalar y correr modelos locales (Llama, Mistral, Qwen)
- [ ] Prompt Engineering: system prompts, few-shot, chain-of-thought
- [ ] Structured outputs (hacer que el LLM devuelva JSON)

### Recursos:
- **Ollama** (ollama.com) - Instalar y probar modelos gratis localmente
- **Anthropic Docs** - Documentacion de la API de Claude
- **Prompt Engineering Guide** (promptingguide.ai)
- **DeepLearning.AI - ChatGPT Prompt Engineering** (curso gratis)

### Proyecto practico:
- Instalar Ollama y probar 3 modelos diferentes
- Crear un script Python que se conecte a Ollama y mantenga una conversacion
- Crear un agente simple que reciba instrucciones y genere codigo

### Criterio de avance:
Puedes crear un script que se conecta a un LLM, le envia prompts y procesa respuestas.

---

## Fase 2: Frameworks de Agentes (Semanas 7-10)

**Objetivo:** Dominar los frameworks principales para crear agentes.

### Que estudiar:
- [ ] **LangChain** - Cadenas, prompts, parsers, herramientas
- [ ] **LangGraph** - Grafos de agentes con estado y flujos
- [ ] **CrewAI** - Definir agentes con roles, tareas y comunicacion
- [ ] Concepto de "tools" - dar herramientas a los agentes (buscar, escribir archivos, ejecutar codigo)
- [ ] Memoria de agentes: corto plazo, largo plazo, compartida

### Recursos:
- **LangChain Docs** (python.langchain.com)
- **CrewAI Docs** (docs.crewai.com)
- **DeepLearning.AI - LangChain for LLM Application Development** (curso)
- **DeepLearning.AI - Multi AI Agent Systems with CrewAI** (curso)

### Proyecto practico:
- Crear un crew de CrewAI con 3 agentes:
  - Agente Investigador (busca informacion)
  - Agente Escritor (genera contenido)
  - Agente Revisor (valida calidad)
- Hacer que se comuniquen y produzcan un resultado final

### Criterio de avance:
Puedes crear un sistema multi-agente que resuelve una tarea dividiendola entre agentes especializados.

---

## Fase 3: RAG y Memoria (Semanas 11-13)

**Objetivo:** Dar "conocimiento" y "memoria" a tus agentes.

### Que estudiar:
- [ ] Que son los embeddings y como funcionan
- [ ] Vector databases: ChromaDB (local), Pinecone (nube)
- [ ] RAG (Retrieval Augmented Generation) - flujo completo
- [ ] Chunking strategies (como dividir documentos)
- [ ] Memoria conversacional vs memoria a largo plazo

### Recursos:
- **ChromaDB Docs** (docs.trychroma.com)
- **DeepLearning.AI - LangChain: Chat with Your Data** (curso)
- **RAG from scratch** (serie de videos de LangChain en YouTube)

### Proyecto practico:
- Sistema RAG que indexa la documentacion de un proyecto y responde preguntas
- Agente con memoria que recuerda conversaciones anteriores

### Criterio de avance:
Puedes crear un agente que consulta documentos propios y mantiene contexto entre sesiones.

---

## Fase 4: Tu Vision - Equipo Multi-Agente de Software (Semanas 14-18)

**Objetivo:** Construir tu sistema de agentes especializados en desarrollo de software.

### Que estudiar:
- [ ] **MetaGPT** - Analizar su arquitectura (es exactamente tu vision)
- [ ] Patrones de comunicacion entre agentes (secuencial, jerarquico, colaborativo)
- [ ] Code generation con LLMs: mejores practicas
- [ ] Validacion y testing automatizado de codigo generado
- [ ] Orquestacion: como coordinar multiples agentes

### Arquitectura a construir:

```
[Agente PM]           -> Define requisitos y user stories
     |
[Agente Arquitecto]   -> Diseña la estructura del proyecto
     |
  ---+---
  |     |
[Backend] [Frontend]  -> Generan codigo segun la arquitectura
  |     |
  ---+---
     |
[Agente QA]           -> Revisa, testea y valida
     |
[Agente Docs]         -> Genera documentacion
```

### Proyecto practico (TU PROYECTO ESTRELLA):
- Construir un sistema donde le describes una app y los agentes:
  1. Definen los requisitos
  2. Disenan la arquitectura
  3. Generan el codigo (backend + frontend)
  4. Escriben tests
  5. Generan documentacion
- Usar Ollama con modelos locales para que sea 100% gratis

### Criterio de avance:
Tienes un sistema funcional que genera un proyecto basico completo a partir de una descripcion.

---

## Fase 5: Infraestructura y Deploy (Semanas 19-22)

**Objetivo:** Profesionalizar tu stack y prepararte para produccion.

### Que estudiar:
- [ ] **Docker** - Contenerizar cada agente
- [ ] Docker Compose - Orquestar multiples contenedores
- [ ] APIs con FastAPI - Exponer tus agentes como servicios
- [ ] Monitoreo: logs, metricas, costos de tokens
- [ ] Seguridad: rate limiting, validacion de inputs, sandboxing

### Recursos:
- **Docker Docs** (docs.docker.com)
- **FastAPI Tutorial** (fastapi.tiangolo.com)
- **TechWorld with Nana - Docker** (YouTube)

### Proyecto practico:
- Dockerizar tu sistema multi-agente
- Crear una API REST que reciba peticiones y distribuya trabajo a los agentes
- Dashboard simple para ver el progreso de los agentes

### Criterio de avance:
Tu sistema corre en contenedores y puede ser accedido via API.

---

## Fase 6: Portafolio y Posicionamiento (Semanas 23-26)

**Objetivo:** Demostrar tus habilidades y conseguir oportunidades.

### Acciones:
- [ ] Publicar tu proyecto estrella en GitHub con README profesional
- [ ] Escribir 3-5 articulos/posts sobre lo que aprendiste (LinkedIn, Medium, Dev.to)
- [ ] Crear demos en video de tus sistemas multi-agente
- [ ] Actualizar CV y LinkedIn con los proyectos
- [ ] Contribuir a proyectos open source: LangChain, CrewAI, MetaGPT
- [ ] Buscar comunidades: Discord de LangChain, CrewAI, AI Engineering

### Donde buscar trabajo:
- **Remoto internacional:** LinkedIn (filtrar "AI Agent", "LLM Engineer"), Wellfound, Turing
- **Freelance:** Upwork, Toptal (proyectos de automatizacion con IA)
- **Peru/Latam:** Empresas de tecnologia que estan adoptando IA
- **Contribuciones open source** -> Pueden llevar a ofertas laborales

---

## Resumen del Timeline

| Fase | Semanas | Que logras |
|------|---------|------------|
| 0. Python | 1-3 | Dominas Python basico-intermedio |
| 1. LLMs | 4-6 | Creas tu primer agente con Ollama |
| 2. Frameworks | 7-10 | Dominas CrewAI/LangChain, creas sistemas multi-agente |
| 3. RAG | 11-13 | Agentes con memoria y conocimiento propio |
| 4. Proyecto estrella | 14-18 | Tu equipo de agentes que genera software |
| 5. Infra | 19-22 | Todo dockerizado y profesional |
| 6. Portafolio | 23-26 | Listo para aplicar a trabajos |

**Tiempo total: ~6 meses** (dedicando 2-3 horas diarias)

---

## Herramientas que necesitas instalar YA

1. **Python 3.11+** - python.org
2. **Ollama** - ollama.com (para modelos locales gratis)
3. **VS Code** con extensiones de Python
4. **Git** (ya lo tienes)
5. **Docker Desktop** (para mas adelante)

## Modelos recomendados para empezar (gratis con Ollama)

| Modelo | Tamano | Para que |
|--------|--------|---------|
| `llama3.2:3b` | 2 GB | Pruebas rapidas, aprender |
| `mistral` | 4 GB | Buen balance calidad/velocidad |
| `qwen2.5-coder` | 4-8 GB | Especializado en codigo |
| `deepseek-coder-v2` | 8 GB | Muy bueno generando codigo |
| `llama3.1:8b` | 5 GB | General purpose, buena calidad |

---

> "No necesitas saber programar todo a mano. Necesitas saber orquestar a quienes programan por ti."
> -- La mentalidad del AI Agent Engineer
