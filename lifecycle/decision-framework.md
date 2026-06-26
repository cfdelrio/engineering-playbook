# Decision Framework

> Cómo decidimos. Cuándo consultamos. Cuándo actuamos solos.

## Niveles de decisión

### Nivel 1: Constitution (No negociable)

**Autoridad**: Fundador.

**Quién cambia**: Vía ADR aprobado de nivel transversal.

**Ejemplo**:
- "Toda feature lleva spec antes de código." (Art. 2 — Spec Before Code)
- "Quality gates son 6." (Art. 4)

**Cómo discutir**:
- Proponer ADL nuevo si afecta transversalmente.
- Proponer ADR en el proyecto si es local.

---

### Nivel 2: ADL — Architecture Decision Log (Transversal)

**Autoridad**: CTO + Staff Engineers.

**Quién propone**: Cualquiera que vea un patrón repetido.

**Cuándo aplica**:
- Decisión afecta 2+ proyectos.
- Tiene implicaciones tecnológicas o financieras significativas.
- Es difícil de revertir.

**Proceso**:
1. Proponer como ADL-Draft (PR al playbook).
2. Feedback mínimo 1 semana.
3. Votación de Staff Engineers.
4. Si pasa, se convierte en ADL-NNN oficial.

**Cambios futuros**: Nueva versión ADL, marca vieja como "replaced".

---

### Nivel 3: ADR — Architecture Decision Record (Por proyecto)

**Autoridad**: Staff Engineer del proyecto.

**Quién propone**: Cualquier engineer con decisión estructural.

**Cuándo aplica**:
- Afecta estructura del proyecto.
- Depende o introduce una dependencia mayor.
- Tiene impacto a largo plazo.

**Proceso**:
1. Escribir ADR-NNN (template en playbook).
2. Compartir en PR o documento.
3. Aprobación de Staff Engineer (puede ser automática si es menor).
4. Commitear con el código.

---

### Nivel 4: PRD / Feature Spec (Durante planning)

**Autoridad**: Product + Staff Engineer.

**Quién propone**: Product.

**Cuándo aplica**:
- Decisiones de scope, UX, prioridad de features.

**Proceso**:
1. Product Brief (1 página).
2. Domain Spec (detalles de dominio).
3. Tech Spec (implementación).
4. Acceptance Criteria (verificación).

Ver [`docs/specs/spec-process.md`](../docs/specs/spec-process.md).

---

### Nivel 5: Code Review (Durante PR)

**Autoridad**: Revisor de código.

**Quién propone**: Engineer propone en PR.

**Cuándo aplica**:
- Decisiones pequeñas, locales, reversibles.
- Nombre de función, estructura de carpetas, abstracción.

**Proceso**:
1. Proponer en PR.
2. Revisor aprueba o sugiere alternativa.
3. Si hay duda, escala a Staff Engineer (Nivel 3).

---

## Matriz de decisión

| Tipo de decisión | Nivel | Autoridad | Documentar | Revertir |
|---|---|---|---|---|
| "Usamos PostgreSQL" | 2 (ADL) | CTO | Sí, transversal | Muy caro |
| "Engine separado de parser" | 3 (ADR) | Staff Eng | Sí, en proyecto | Caro |
| "Esta feature tiene Z3 focus" | 4 (Spec) | Product | Sí, en feature | Fácil (falta) |
| "Variable se llama `load` no `stress`" | 5 (Code Review) | Revisor | No (obvio) | Fácil |

---

## Cuándo NO necesita documento

- Cambios cosméticos (typos, comentarios).
- Refactors locales sin cambio de comportamiento.
- Bug fixes obvios.

**Pero sí necesita**: Buen mensaje de commit.

---

## Cómo escalar una decisión

```
Nivel 5 (Code Review)
  ↓
"¿Esta variable de nombre `X` es obviamente correcta?"
  ├─ Sí → aprobado.
  └─ No, hay ambigüedad → escala.
        ↓
      Nivel 4 (Spec)
        ↓
      "¿Esta decisión afecta comportamiento observable?"
        ├─ Sí → documentar en feature spec.
        └─ No → vuelve a Nivel 5 con contexto.
              ↓
            Nivel 3 (ADR)
              ↓
            "¿Esto afecta estructura del proyecto?"
              ├─ Sí → ADR del proyecto.
              └─ No → vuelve a Nivel 4.
                    ↓
                  Nivel 2 (ADL)
                    ↓
                  "¿Afecta 2+ proyectos?"
                    ├─ Sí → proponer ADL.
                    └─ No → ADR suficiente.
```

---

## Antipatrones

❌ **"Decidir sin documentar."**
- Dos meses después: "¿Por qué hicimos esto?"
- Respuesta vacía.

✅ **Siempre documentar decisiones que importan.**

---

❌ **"Esperar decisión del nivel equivocado."**
- ADR requiere aprobación CTO para cambio de nombre.
- Desperdicio de tiempo.

✅ **Escalar solo si hay ambigüedad real.**

---

❌ **"Mezclar niveles."**
- Feature Spec documenta decisión de infraestructura.
- Confusión después.

✅ **Cada documento en su nivel.**

---

## Responsabilidades

### Engineer
- Propone decisión con contexto.
- Escala si no sabe qué nivel.
- Implementa aprobada.

### Staff Engineer / Revisor
- Aprueba Nivel 3-5.
- Rechaza si no está clara.
- Escala a CTO si cree que es Nivel 2.

### CTO
- Aprueba Nivel 1-2.
- Vela por coherencia transversal.
- Guía framework de decisión.

### Product
- Propone Nivel 4 (Specs).
- Collabora en definición de éxito.

---

Anterior: [`ADL.md`](./ADL.md) · Siguiente: [`document-lifecycle.md`](./document-lifecycle.md)
