# Document Lifecycle

> Cómo nacen, viven, evolucionan y mueren los documentos de ingeniería.

## Estados de un documento

```
Idea
  ↓
Draft (escrito, no aprobado)
  ↓
Review (esperando aprobación)
  ↓
Published (oficial, en uso)
  ↓
Obsolete (reemplazado o descartado)
  ↓
Archived (histórico, para referencia)
```

---

## Por tipo de documento

### Constitution (CONSTITUTION.md)

**Ciclo de vida**:
1. **Published** — está desde el inicio (contiene reglas fundacionales).
2. **Update via ADL**: Si necesita cambio, se escribe ADL nuevo que reemplaza.
3. **Archived** — vieja versión archivada.

**Cambios**:
- Jamás se modifica in-place.
- Toda modificación es vía ADL aprobado.

---

### ADL (Architecture Decision Log)

**Ciclo de vida**:
1. **Draft** — propuesta de decisión transversal.
   - Vive en PR al playbook.
   - Duración: 1-2 semanas de feedback.
2. **Review** — esperando votación.
   - Mínimo 3 Staff Engineers han leído.
   - CTO votó.
3. **Published** — oficial.
   - Directorio `decisions/adl/ADL-NNN.md`.
   - Todos los nuevos proyectos lo heredan.
4. **Obsolete** (no es "deleted"):
   - Marcado como "Replaced by ADL-NNN+1".
   - Se archiva para referencia histórica.

---

### ADR (Architecture Decision Record)

**Ciclo de vida**:
1. **Draft** — decisión local del proyecto.
   - Vive en rama feature.
   - Discutido en PR.
2. **Published** — aprobado.
   - Commiteado en `docs/architecture/adr/`.
   - Inmutable de ahora en adelante.
3. **Obsolete** — si hay cambio.
   - Marcado como "Replaced by ADR-NNN+1".
   - Nuevo ADR explica transición.

**Nota**: ADR nunca se "borra". Es historia.

---

### Feature Spec

**Ciclo de vida**:
1. **Draft** — Product escribe, Engineer revisa.
   - Vive en documento colaborativo o rama.
   - Puede cambiar.
2. **Review** — producto definido, esperando aprobación.
3. **Published** — aprobado.
   - Committeado en `docs/specs/`.
4. **In Progress** — se está implementando.
   - Spec puede actualizarse si realidad contradice.
   - Todos los cambios se registran.
5. **Implemented** — código mergeado.
6. **Released** — en producción.
7. **Obsolete** — reemplazado por nueva feature.

---

### Playbook / Template

**Ciclo de vida**:
1. **Draft** — nueva página o plantilla.
2. **Review** — feedback de usuario (project que la usaría).
3. **Published** — oficial en playbook.
4. **Obsolete** — mejor forma descubierta.
   - Marcado como "Deprecated. Ver [nueva página]."
   - Se mantiene por backref

---

## Metadata requerida

Todo documento oficial debe tener al inicio:

```markdown
| Campo | Valor |
|---|---|
| **Status** | Published · Obsolete · Archived |
| **Last Updated** | AAAA-MM-DD |
| **Applies To** | AURORA · Engage · ProdeCaballito · Storysell · All |
| **Maintainer** | nombre o role |
| **Supersedes** | [link si reemplaza otro] |
| **Superseded By** | [link si fue reemplazado] |
```

---

## Cambios sin reescribir

A veces descubrís que un documento está incompleto o tiene pequeño error:

✅ **Sí, puedes actualizar**:
- Typos.
- Aclaraciones que no cambian el significado.
- Ejemplos adicionales.
- Links actualizados.

❌ **No, escribe nueva versión**:
- Cambio de decisión.
- Corrección de error fundamental.
- Nueva sección importante.

**Regla práctica**: Si la vieja versión y la nueva podrían coexistir sin conflicto, actualiza. Si alguien que confió en la vieja versión se vería sorprendido, escribe nueva.

---

## Versionado

No usamos semver. Usamos **descuento explícito**:

```markdown
## Histórico

- **2026-07-15**: ADL-003 v2. Aclaración sobre graphql-only (no REST).
  - [Cambio](ADL-003-v2.md)
- **2026-06-26**: ADL-003 original. GraphQL + REST en parallel.
  - [Version anterior](ADL-003-v1.md) [Archived]
```

---

## Cómo archivan

Documentos obsoletos NO se borran. Se archi

van:

1. Renombrar: `ADR-001-foo.md` → `ADR-001-foo.OBSOLETE.md`.
2. Mover a carpeta: `docs/architecture/adr/archive/`.
3. Marcar en índice: `docs/architecture/adr/README.md` lista obsoletos con links a nuevas versiones.

---

## Búsqueda y referencias

Cuando alguien dice "¿Dónde está...?":

- **ADLs**: `engineering-playbook/decisions/adl/`
- **ADRs**: `PROJECT/docs/architecture/adr/`
- **Specs**: `PROJECT/docs/specs/`
- **Playbook**: `engineering-playbook/playbook/`

Cada índice debe mantener:
- Lista de vigentes.
- Links a obsoletos (para contexto histórico).

---

## Responsabilidad de mantenimiento

| Documento | Responsable |
|---|---|
| Constitution | CTO |
| ADL | CTO, Staff Engineers |
| ADR (proyecto) | Staff Engineer del proyecto |
| Feature Spec | Product + Staff Engineer |
| Playbook | CTO (guía), engineers (feedback) |
| Template | Whoever used it first (refine after use) |

---

## Cadencia

**Revisión de documentos**:
- Trimestral: ¿Hay ADLs obsoletos?
- Después de sprint: ¿Nuevas ADRs? ¿Specs implementadas?
- Anual: ¿El playbook sigue siendo útil?

Si encuentra documento que no responde a realidad → escala.

---

Anterior: [`decision-framework.md`](./decision-framework.md) · Volver a [`../`](../)
