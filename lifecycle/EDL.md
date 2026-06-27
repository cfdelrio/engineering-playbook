# Engineering Development Lifecycle (EDL)

> Las fases por las que pasa cualquier trabajo de ingeniería: desde la idea hasta el aprendizaje post-release.

## Contexto

El EDL es el marco que define las fases del trabajo de ingeniería en todos nuestros proyectos. No es un proceso rígido —es una guía de qué sucede, en qué orden, y qué produce cada etapa.

La diferencia clave con metodologías como Scrum o Waterfall: el EDL **no prescribe duración ni ceremonia**. Define fases, entregables y decisiones.

---

## Las 9 fases

### L0 — Foundation

**Qué es**: El proyecto existe. Tiene estructura, repo, estándares básicos, y un nivel de madurez EML definido.

**Cuándo ocurre**: Una sola vez al inicio del proyecto.

**Entregables**:
- README con misión del proyecto
- CONSTITUTION adoptada (referencia a este playbook)
- ADR-001: Engineering Maturity Level elegido
- Estructura de carpetas según `standards/repository-topology.md`
- EML configurado (CI, documentación mínima, etc.)

**Quién lidera**: Staff Engineer.

---

### L1 — Product

**Qué es**: El producto decide qué construir y por qué. Se define el problema, el usuario, y el criterio de éxito.

**Cuándo ocurre**: Antes de cualquier diseño técnico.

**Entregables**:
- Product Brief (1 página: problema, usuario, métrica de éxito)
- DEC (si hay decisión de producto significativa)
- Prioridad de backlog actualizada

**Quién lidera**: Product + Staff Engineer.

**Regla**: Sin Product Brief aprobado, no se avanza a L2.

---

### L2 — Domain

**Qué es**: El equipo entiende el dominio del problema. Se define el lenguaje ubicuo, las entidades, y cómo encaja con el modelo existente.

**Cuándo ocurre**: Después del Product Brief, antes del diseño técnico.

**Entregables**:
- Domain Spec (entidades, value objects, reglas de negocio afectadas)
- Actualización al `ubiquitous-language.md` si hay términos nuevos
- Mapa de bounded contexts afectados

**Quién lidera**: Staff Engineer con dominio del área.

**Regla**: Los términos de dominio se eligen en esta fase. No se cambian después sin ADR.

---

### L3 — Architecture

**Qué es**: Se diseña la solución técnica. Se toman decisiones de arquitectura.

**Cuándo ocurre**: Después de entender el dominio.

**Entregables**:
- Technical Spec (cómo se implementa: capas, contratos, datos)
- ADR si hay decisión estructural nueva (nuevo servicio, nueva dependencia mayor, cambio de patrón)
- Diagramas C4 actualizados si hay cambio de componentes

**Quién lidera**: Staff Engineer.

**Regla**: Las decisiones de arquitectura se documentan antes de implementar, no después.

---

### L4 — Specification

**Qué es**: Se escribe la spec completa. Se define exactamente qué se construye y cómo se verifica.

**Cuándo ocurre**: Antes de escribir código.

**Entregables**:
- Feature Spec completa (Product Brief + Domain Spec + Technical Spec + Acceptance Criteria)
- Acceptance Criteria numerados y verificables
- Estimación de esfuerzo (si el equipo usa esto)

**Quién lidera**: Product + Staff Engineer en co-autoría.

**Regla**: Sin spec aprobada, no hay implementación. (CONSTITUTION Art. 2 — Spec Before Code)

---

### L5 — Implementation

**Qué es**: Se escribe el código. Se construye lo especificado.

**Cuándo ocurre**: Después de spec aprobada.

**Entregables**:
- Código en branch de feature
- Tests unitarios y de integración
- Actualización de documentación si el código cambia el comportamiento público

**Quién lidera**: Engineer.

**Regla**: El código debe pasar los quality gates antes de code review. (CONSTITUTION Art. 4)

---

### L6 — Validation

**Qué es**: Se verifica que lo construido hace lo que la spec dijo. Code review y QA.

**Cuándo ocurre**: Antes de merge a main.

**Entregables**:
- PR aprobado con todos los quality gates verdes
- Acceptance Criteria verificados (manual o automáticamente)
- Spec actualizada si hubo desvíos necesarios (con explicación)

**Quién lidera**: Revisor (Staff Engineer en cambios significativos).

**Regla**: La spec es el contrato. Si el código desvía, la spec debe actualizarse o el código debe corregirse. No ambos coexisten silenciosamente.

---

### L7 — Release

**Qué es**: El trabajo llega a producción. Se comunica el cambio.

**Cuándo ocurre**: Después de merge y QA en staging.

**Entregables**:
- Deploy a producción
- CHANGELOG actualizado
- Tag de versión (si aplica por EML)
- Comunicación a usuarios afectados (si aplica)
- Spec actualizada a status "Released"

**Quién lidera**: Staff Engineer + DevOps/Engineer.

---

### L8 — Learn

**Qué es**: Se aprende de lo que pasó. Se captura conocimiento para el siguiente ciclo.

**Cuándo ocurre**: Después de producción, cuando hay datos.

**Entregables**:
- Métricas de éxito vs criterio definido en L1
- Post-mortem si hubo incidente (obligatorio si hubo downtime)
- Feedback capturado para backlog (¿qué cambiaríamos?)
- ADR si se descubrió algo que requiere decisión de arquitectura retroactiva

**Quién lidera**: Product + Staff Engineer.

**Regla**: No se declara éxito sin medir contra el criterio del Product Brief.

---

## Resumen de fases

| Fase | Nombre | Entregable principal | Quién |
|---|---|---|---|
| L0 | Foundation | Repo listo, EML definido | Staff Eng |
| L1 | Product | Product Brief | Product + Staff Eng |
| L2 | Domain | Domain Spec | Staff Eng |
| L3 | Architecture | Technical Spec + ADR | Staff Eng |
| L4 | Specification | Feature Spec completa | Product + Staff Eng |
| L5 | Implementation | Código + Tests | Engineer |
| L6 | Validation | PR aprobado, AC verificados | Revisor |
| L7 | Release | Deploy + CHANGELOG | Staff Eng |
| L8 | Learn | Métricas + Feedback | Product + Staff Eng |

---

## Relación con otros conceptos

- **ADL** (Architecture Decision Log): Los ADLs transversales viven fuera del EDL, pero se crean típicamente en L3 cuando se identifica un patrón que cruza proyectos.
- **ADR**: Se crean en L3 (Architecture) de cada feature o proyecto.
- **Feature Spec**: Se completa en L4 (Specification).
- **EML**: Se define en L0 (Foundation) y determina los requisitos de L5-L7.

---

## Notas de implementación

El EDL no requiere herramientas específicas. Se puede aplicar con:
- GitHub Issues (una issue por fase)
- Un documento de planning simple
- Conversaciones en PR + commits bien nombrados

La formalidad escala con el EML del proyecto.

---

Anterior: [`ADL.md`](./ADL.md) · Siguiente: [`decision-framework.md`](./decision-framework.md) · [Índice](../)
