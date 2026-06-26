# ADL — Architecture Decision Log

> Registro centralizado de decisiones arquitectónicas de todos los proyectos.
>
> No es por proyecto. Es la historia de decisiones transversales que afectan múltiples productos.

## Propósito

Cada proyecto (AURORA, Engage, etc.) tiene sus ADRs en `docs/architecture/adr/`.

El ADL es diferente: es un **índice central de decisiones que cruzan proyectos**.

Ejemplo:
- **ADR-001 (AURORA)**: "Engine separado de parser FIT."
  - Solo afecta AURORA.
- **ADL-001 (playbook)**: "Usamos PostgreSQL como base de datos estándar."
  - Afecta todos los proyectos.

---

## Estructura

```
engineering-playbook/
├── lifecycle/
│   ├── ADL.md (este archivo)
│   ├── decisions/
│   │   ├── ADL-001-postgresql-standard.md
│   │   ├── ADL-002-event-sourcing-optional.md
│   │   ├── ADL-003-api-graphql-rest.md
│   │   ...
```

## Decisiones transversales

Una decisión es **transversal** si:

1. Afecta más de uno de nuestros productos.
2. Es difícil de revertir (lock-in tecnológico).
3. Tiene consecuencias de largo plazo.

**Ejemplos que sí van en ADL**:
- "Usamos PostgreSQL (no MongoDB, no DynamoDB)."
- "Deployamos en AWS (no GCP, no Azure)."
- "Arquitectura hexagonal es estándar (no MVC, no monolito)."
- "Language: TypeScript/Node.js (no Python, no Go)."

**Ejemplos que NO van (van en proyecto)**:
- "AURORA: parser FIT separado de engine."
- "Engage: integración con Slack."
- "ProdeCaballito: análisis de cuotas de apuestas."

---

## Cómo se escribe un ADL

Usar el [template de ADR](../templates/adr-template.md) pero en el nivel meta:

```markdown
# ADL-NNN — [Decisión transversal]

| Campo | Valor |
|---|---|
| **Estado** | Propuesto · Aceptado · Reemplazado |
| **Fecha** | AAAA-MM-DD |
| **Decisores** | CTO, Staff Engineers |

## Contexto

¿Qué nos obligó a decidir?

## Decisión

Lo que elegimos y por qué.

## Alternativas descartadas

Qué no elegimos y por qué.

## Consecuencias

¿Qué cambia para todos los proyectos?

## Impacto en proyectos existentes

- AURORA: ...
- Engage: ...
- ProdeCaballito: ...
- Storysell: ...
```

---

## Procesos de cambio

**Para agregar un ADL**:
1. Proponer como ADL-Draft (Pull Request).
2. Feedback de Staff Engineers de todos los proyectos.
3. Aceptado → se convierte en ADL-NNN oficial.

**Para cambiar un ADL**:
- No se reescribe. Se crea ADL-NNN+1 que lo reemplaza.
- El viejo se marca como `Replaced by ADL-NNN+1`.

---

## Cómo impacta en un proyecto nuevo

Cuando arranques un proyecto nuevo (e.g., Product X):

1. Leé todos los ADLs vigentes.
2. Son tus reglas por defecto.
3. Si necesitás excepción, debe ser explícita (con aprobación CTO).

Ejemplo:
```markdown
# PRODUCT_X — Architecture Decisions

## Adopción de ADLs

Adoptamos todos los ADLs vigentes:
- ADL-001: PostgreSQL ✓
- ADL-002: Event Sourcing (optional, no usamos)
- ADL-003: GraphQL + REST ✓
- ADL-004: AWS ✓

## Excepciones

- ADL-005 (Monolith by default): Excepción aprobada.
  Justificación: Product X es experimental. Monolito por velocidad.
  Plan: Transición a microservicios en fase 2.
```

---

## Cómo impacta en AURORA, Engage, etc.

**Retroactivo**:
- AURORA ya tiene arquitectura hexagonal (cumple ADL futuro).
- No necesita cambios.

**Prospectivo**:
- Cualquier nueva decisión se verifica contra ADLs.
- Si hay conflicto, excepción explícita o revisa ADL.

---

Siguiente: [`decision-framework.md`](./decision-framework.md)
