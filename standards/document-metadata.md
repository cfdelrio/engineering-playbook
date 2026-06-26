# Document Metadata Standard

> Metadatos consistentes en todos los documentos de ingeniería.

## Encabezado estándar

Cada documento oficial (ADR, spec, decisión) lleva esto al inicio:

```markdown
# [Title]

| Campo | Valor |
|---|---|
| **Status** | Propuesto · Aceptado · En Progreso · Completado · Obsoleto · Archived |
| **Type** | ADL · ADR · Feature Spec · Playbook · Template · Runbook · Guide |
| **Created** | AAAA-MM-DD |
| **Last Updated** | AAAA-MM-DD |
| **Author** | Nombre o email |
| **Maintainer** | Role (e.g., CTO, Staff Engineer, Product Manager) |
| **Applies To** | AURORA · Engage · ProdeCaballito · Storysell · Engineering-Playbook · All |
| **Supersedes** | [Link al anterior, si aplica] |
| **Superseded By** | [Link al sucesor, si aplica] |
| **Discussion** | [Link a PR, issue, Slack thread, etc] |

---

[Contenido del documento]
```

---

## Tabla de estados

| Estado | Significado | Qué hacer |
|---|---|---|
| **Propuesto** | Idea, esperando discusión. | Buscar feedback. Escalar si hace falta. |
| **Aceptado** | Decisión tomada, listos para implementar. | Empezar trabajo. |
| **En Progreso** | Se está implementando / escribiendo. | Actualizar periódicamente. |
| **Completado** | Implementado. En uso. | Monitorear que se use como se especificó. |
| **Obsoleto** | Reemplazado o descartado. | Mantener para referencia histórica. |
| **Archived** | Histórico, no aplica más. | Referencia solo. |

---

## Tipos de documento

| Tipo | Dónde vive | Quién escribe | Frecuencia |
|---|---|---|---|
| **ADL** | `playbook/decisions/adl/` | Staff Engineers | Raro (~1-2/año) |
| **ADR** | `PROJECT/docs/architecture/adr/` | Engineer del proyecto | Cada cambio estructural |
| **Feature Spec** | `PROJECT/docs/specs/` | Product + Engineer | Cada feature |
| **Playbook** | `playbook/playbook/` | Staff Engineers | Actualizaciones periódicas |
| **Template** | `playbook/templates/` | Primero que la usó | Cada nueva necesidad |
| **Runbook** | `PROJECT/docs/runbooks/` | Operations + Engineer | Por problema operacional |
| **Guide** | `playbook/guides/` | Engineer | Conocimiento que cruzaría proyectos |

---

## Campos específicos por tipo

### ADL

```markdown
| Campo | Valor |
|---|---|
| **Status** | Propuesto · Aceptado · Reemplazado |
| **Type** | ADL |
| **Decision** | [Una frase clara de qué se decidió] |
| **Alternatives Considered** | [Qué se descartó] |
| **Decision Date** | [Cuándo se tomó] |
| **Unanimous** | Sí / No (y por qué divergencias) |
```

### ADR

```markdown
| Campo | Valor |
|---|---|
| **Status** | Aceptado · Reemplazado |
| **Type** | ADR |
| **ADR Number** | ADR-NNN |
| **Decision** | [Una frase] |
| **Context** | [Qué nos llevó a decidir] |
| **Alternatives** | [Qué descartamos] |
```

### Feature Spec

```markdown
| Campo | Valor |
|---|---|
| **Status** | Propuesto · Aceptado · En Progreso · Completado · Cancelled |
| **Type** | Feature Spec |
| **Target Release** | AURORA v0.2, Q3 2026, etc. |
| **Product Brief Link** | [Si existe] |
| **Domain Spec Link** | [Si existe] |
| **Tech Spec Link** | [Si existe] |
| **Acceptance Criteria Count** | N |
| **Risk Level** | Low · Medium · High |
```

---

## Tagging convencional

Si algun documento toca múltiples áreas, usa tags:

```markdown
| Campo | Valor |
|---|---|
| **Tags** | security, performance, infrastructure, api-design |
```

Permite buscar documentos relacionados.

---

## Versionado de documentos

Cuando necesita una "versión 2" (cambio significativo):

```markdown
| Campo | Valor |
|---|---|
| **Version** | 1.0 (original) o 2.0 (major change) |
| **Previous Version** | [Link a v1.0 si es v2.0] |
| **Breaking Changes** | [Qué cambió desde v1.0] |
```

---

## Footer estándar

Al final de cada documento:

```markdown
---

**Document History**
| Date | Change | Author |
|---|---|---|
| 2026-06-26 | Creación | Tu nombre |
| 2026-07-01 | Aclaración sobre X | Otro engineer |

**Related Documents**
- [Link a documento relacionado 1]
- [Link a documento relacionado 2]

---

Anterior: [Link] · Siguiente: [Link] · [Índice](../)
```

---

## Búsqueda facilitada

Con metadatos consistentes, puedo buscar:
- Por estado: `grep -r "Status.*Obsoleto"` → encontrar qué cambió.
- Por aplicabilidad: `grep -r "Applies To.*All"` → reglas transversales.
- Por tipo: `grep -r "Type.*ADR"` → todas las decisiones de arquitectura de AURORA.

---

## Checklista de documentación

Antes de publicar:

- [ ] Encabezado con tabla de metadata.
- [ ] Status está explícito.
- [ ] "Applies To" identifica scope.
- [ ] "Author" y "Maintainer" claros.
- [ ] Links "Supersedes / Superseded By" si aplica.
- [ ] Footer con navegación.
- [ ] Sin typos.
- [ ] Tono consistente con playbook.

---

Siguiente: [`repository-topology.md`](./repository-topology.md)
