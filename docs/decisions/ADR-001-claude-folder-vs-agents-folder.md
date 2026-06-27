# ADR-001 — Mantener `claude/` en lugar de renombrar a `agents/`

| Campo | Valor |
|---|---|
| **Status** | Aceptado |
| **Type** | ADR |
| **ADR Number** | ADR-001 |
| **Created** | 2026-06-27 |
| **Author** | Carlos del Río |
| **Applies To** | Engineering-Playbook |
| **Decision** | No renombrar la carpeta `claude/` a `agents/` en v1.0.0 |

---

## Contexto

El Engineering Playbook contiene una carpeta `claude/` con contexto e instrucciones para trabajar con Claude Code como agente de IA. A medida que el ecosistema de agentes crece (Cursor, Copilot, Gemini Code Assist, modelos locales), existe la pregunta de si la carpeta debería ser más agnóstica al proveedor.

El argumento para renombrar: `agents/` sería más neutral y el playbook no dependería de un proveedor específico.

El argumento en contra: el rename tiene un costo real de compatibilidad y distracción de foco.

## Decisión

No renombrar `claude/` a `agents/` en v1.0.0.

## Justificación

**1. La carpeta es concretamente para Claude Code, no genérica.**
El contenido actual (`system.md`, `architecture.md`, etc.) contiene instrucciones específicas para el comportamiento de Claude Code. No son instrucciones genéricas para cualquier agente. Renombrar sin cambiar el contenido sería cosmético y confuso.

**2. El costo de renombrar es alto.**
Todos los proyectos que ya usen este playbook y referencien `claude/` desde su `CLAUDE.md` necesitarían actualizar sus referencias. Esto es un breaking change (MAJOR) sin beneficio funcional.

**3. La neutralidad de proveedor se logra de otra forma.**
Si en el futuro se adoptan otros agentes (Cursor, Copilot), la solución correcta es:
- Crear carpetas específicas: `cursor/`, `copilot/`
- O crear una carpeta `agents/` que contenga subdirectorios por proveedor
- No renombrar la carpeta existente

**4. El momento no es ahora.**
v1.0.0 es una release de estabilización. No es el momento para romper compatibilidad con proyectos que ya adoptaron la estructura.

## Alternativas consideradas

**Opción A: Renombrar inmediatamente a `agents/`**
- Pro: más agnóstico, parece mejor long-term
- Contra: breaking change, costo de migración real, contenido sigue siendo Claude-specific

**Opción B: Crear `agents/claude/` con symlink de `claude/`**
- Pro: neutral y backward compatible
- Contra: agrega complejidad innecesaria, los symlinks en git son frágiles

**Opción C (elegida): Mantener `claude/` y documentar la decisión**
- Pro: no rompe nada, documenta la deuda explícitamente
- Contra: deja un nombre específico de proveedor en el playbook

## Consecuencias

- `claude/` sigue siendo el nombre de la carpeta en v1.0.0
- Este ADR sirve como registro de la consideración
- Para v2.0.0: re-evaluar si la proliferación de agentes justifica la reestructura
- Si se agrega soporte para otro agente, crear su propia carpeta (ej: `cursor/`) y documentar en ADR-NNN

## Revisión futura

Revisar en v2.0.0 o cuando el equipo adopte un segundo agente de IA activamente.

---

**Document History**
| Date | Change | Author |
|---|---|---|
| 2026-06-27 | Creación | Carlos del Río |
