# 13 — AI Assisted Engineering

> La IA es un par de ingeniería de alto rendimiento. Amplifica tu criterio; no lo reemplaza.

## El principio rector

> Un mal criterio asistido por IA produce malas decisiones **más rápido**.

La IA (Claude Code) acelera todo: lo bueno y lo malo. Por eso el criterio humano importa más, no menos. Nuestro trabajo deja de ser teclear y pasa a ser **dirigir, especificar y verificar**.

## Cómo trabajamos con Claude Code

### 1. Contexto primero
La IA es tan buena como el contexto que recibe. El contexto canónico vive en [`claude/`](../claude) y se mantiene actualizado. Un proyecto bien documentado convierte a la IA en experta de ese proyecto.

### 2. Spec antes de pedir
No le pedimos a la IA "hacé X" en el vacío. Le damos una [feature spec](../templates/feature-spec-template.md). Una spec clara produce implementación clara.

### 3. Iterá en pasos chicos
Pedidos acotados, verificables, reversibles. Un cambio gigante generado de una es imposible de revisar con criterio.

### 4. Verificá todo
**Toda salida de IA se revisa con el mismo estándar que el código humano** ([`08-code-review.md`](./08-code-review.md)). La IA puede tener confianza alta y estar equivocada. La verificación no es opcional.

### 5. La IA no decide arquitectura sola
Las decisiones estructurales las toma un humano, con la IA como asesora. Toda decisión así queda en un [ADR](../templates/adr-template.md).

## Qué delegamos bien a la IA

| Delegamos bien | Mantenemos humano |
|---|---|
| Implementar una spec clara | Decidir qué construir y por qué |
| Escribir tests de comportamiento definido | Definir qué significa "correcto" |
| Refactors mecánicos y repetitivos | Decisiones de arquitectura (ADRs) |
| Primera pasada de code review | Aprobar el criterio de diseño y producto |
| Explorar, buscar, mapear el código | Trade-offs de negocio y producto |
| Generar boilerplate y andamiaje | Validar seguridad y datos sensibles |

## Reglas de seguridad con IA

1. **Nunca** secretos reales en prompts ni en archivos de contexto.
2. Acciones destructivas o irreversibles requieren **confirmación humana explícita** — la IA no tiene permiso implícito.
3. La IA opera dentro de los límites de la [Constitution](../CONSTITUTION.md) como cualquier ingeniero.

## El system prompt como artefacto de ingeniería

Cómo le hablamos a la IA es código. Los prompts de sistema viven versionados (ver [`templates/system-prompt-template.md`](../templates/system-prompt-template.md) y la carpeta [`claude/`](../claude)), se revisan y evolucionan como cualquier otra parte del sistema.

## El estándar

La IA escribe rápido; nosotros pensamos despacio donde importa. La velocidad de la IA es valiosa solo si el criterio humano la dirige hacia el lugar correcto.

---

Anterior: [`12-security.md`](./12-security.md) · Siguiente: [`14-roadmap.md`](./14-roadmap.md)
