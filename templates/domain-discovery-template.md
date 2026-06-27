# Domain Discovery — [Nombre del Proyecto o Feature]

> Template para documentar el proceso de Domain Discovery.
> Copiar este archivo a `docs/domain/domain-discovery.md` del proyecto.
> Completar cada sección iterativamente — no es necesario completarlas en orden ni en una sola sesión.

| Campo | Valor |
|---|---|
| **Proyecto** | [nombre] |
| **Feature o Dominio** | [qué se está descubriendo] |
| **Iniciado** | YYYY-MM-DD |
| **Status** | En Progreso · Completado |
| **Experto(s) de dominio** | [nombres o roles] |
| **Equipo de ingeniería** | [nombres o roles] |

---

## Fase 1 — Problem Discovery

### El problema

> En una o dos oraciones: ¿qué problema existe en el mundo real?

[Completar]

### Quién sufre el problema

| Actor | Cómo lo sufre | Frecuencia | Impacto |
|---|---|---|---|
| [rol] | [descripción] | [diaria/semanal/eventual] | [alto/medio/bajo] |

### Cómo lo resuelven hoy

> Sin el software que vamos a construir, ¿cómo lo hacen?

[Completar]

### Criterio de éxito

> ¿Cómo se ve el mundo cuando el problema está resuelto? Verificable.

[Completar]

### Fuera del alcance

> ¿Qué problema relacionado no vamos a resolver?

- [Exclusión 1]
- [Exclusión 2]

### Suposiciones que validar

- [ ] [Suposición 1]
- [ ] [Suposición 2]

---

## Fase 2 — Decision Discovery

### Mapa de decisiones

| Decisión | Frecuencia | Quién | Información actual | Información faltante | Costo de error |
|---|---|---|---|---|---|
| [decisión] | [frecuencia] | [rol] | [qué usan hoy] | [qué ayudaría] | [consecuencia] |

### Decisiones priorizadas

Las decisiones que más impacto tienen si el software las mejora:

1. **[Decisión más crítica]**: [por qué]
2. **[Segunda decisión]**: [por qué]
3. **[Tercera decisión]**: [por qué]

### Decisiones que el software NO debería tomar

> Decisiones que deben seguir siendo humanas.

- [Decisión 1 que permanece humana]: [razón]
- [Decisión 2]: [razón]

---

## Fase 3 — Knowledge Discovery

### Reglas explícitas

> Reglas que el experto puede articular directamente.

| Regla | Condición | Consecuencia | Fuente |
|---|---|---|---|
| [nombre] | Si [condición] | entonces [consecuencia] | [quién lo dijo] |

### Reglas implícitas

> Lo que el experto hace "por instinto" pero no suele decir.

| Regla | Descripción | Validado por experto |
|---|---|---|
| [nombre] | [descripción de la regla no escrita] | [ ] Sí / [ ] No |

### Casos borde y excepciones

> Situaciones donde las reglas normales no aplican.

| Situación | Por qué es diferente | Qué aplica en cambio |
|---|---|---|
| [situación] | [razón] | [regla alternativa] |

### Fuentes de verdad actuales

> Dónde vive hoy el conocimiento que el sistema debería capturar.

| Fuente | Tipo | Dueño | Limitación |
|---|---|---|---|
| [fuente] | [planilla/persona/herramienta/ritual] | [quien la mantiene] | [por qué es insuficiente] |

---

## Fase 4 — Language Discovery

### Lenguaje ubicuo

| Término | Definición | No es | Sinónimos prohibidos | Ejemplo |
|---|---|---|---|---|
| [término] | [qué significa en este dominio] | [qué confunde a los de afuera] | [palabras a evitar] | [instancia concreta] |

### Términos en disputa

> Términos donde distintos actores tienen definiciones diferentes.

| Término | Definición del Rol A | Definición del Rol B | Resolución |
|---|---|---|---|
| [término] | [versión A] | [versión B] | [Pendiente / [solución]] |

---

## Fase 5 — Concept Discovery

### Entidades

> Conceptos con identidad propia que cambian con el tiempo.

| Entidad | Descripción | Cómo se identifica | Ciclo de vida |
|---|---|---|---|
| [nombre] | [qué es] | [qué la hace única] | [cómo cambia] |

### Value Objects

> Conceptos que describen sin tener identidad propia.

| Value Object | Descripción | Atributos | Inmutable |
|---|---|---|---|
| [nombre] | [qué describe] | [sus valores] | [ ] Sí / [ ] No |

### Eventos de dominio

> Cosas que suceden y tienen consecuencias.

| Evento | Cuándo ocurre | Consecuencias | Quién lo origina |
|---|---|---|---|
| [NombreEvento] | [situación] | [qué cambia en el dominio] | [actor o proceso] |

### Políticas y reglas

> Cómo responde el sistema a situaciones del dominio.

| Política | Trigger | Respuesta | Prioridad |
|---|---|---|---|
| [nombre] | Cuando [evento o condición] | [qué hace el sistema] | [alta/media/baja] |

### Roles del dominio

> Actores que participan (no siempre usuarios del sistema).

| Rol | Descripción | Decisiones que toma |
|---|---|---|
| [rol] | [quién es] | [decisiones del mapa de la Fase 2] |

---

## Fase 6 — Relationship Discovery

### Dependencias

| Concepto | Necesita | Para |
|---|---|---|
| [A] | [B] | [para qué] |

### Causalidades

| Si cambia | Se ve afectado |
|---|---|
| [A] | [B, C] |

### Agregados candidatos

> Grupos de conceptos que se tratan siempre juntos.

| Agregado | Raíz | Contiene | Invariante central |
|---|---|---|---|
| [nombre] | [entidad raíz] | [otros conceptos] | [regla que garantiza] |

### Invariantes del dominio

> Reglas que el sistema debe garantizar siempre.

1. [Invariante 1]: [descripción de la garantía]
2. [Invariante 2]: [descripción]

---

## Fase 7 — Domain Boundaries

### Bounded Contexts candidatos

| Contexto | Responsabilidad en una frase | Experto principal | Conceptos centrales |
|---|---|---|---|
| [Nombre] | [qué decisiones mejora] | [rol] | [3-5 conceptos] |

### Context Map

> Cómo se relacionan los bounded contexts.

```
[Contexto A] ──── [tipo de relación] ──── [Contexto B]
    │
    └── [tipo de relación] ──── [Contexto C]
```

Tipos de relación: Conformist, Anti-Corruption Layer, Partnership, Customer/Supplier, Published Language.

### Contratos entre contextos

| De | A | Qué cruza | Formato | Quién es responsable |
|---|---|---|---|---|
| [Ctx A] | [Ctx B] | [qué dato o evento] | [estructura] | [Ctx A / Ctx B] |

---

## Fase 8 — Architecture Discovery

### Decisiones de arquitectura candidatas (para ADR)

| Candidato a ADR | Pregunta de decisión | Urgencia |
|---|---|---|
| [tema] | [qué se debe decidir] | [alta/media/baja] |

### Riesgos técnicos

| Riesgo | Impacto | Probabilidad | Mitigación propuesta |
|---|---|---|---|
| [riesgo] | [alto/medio/bajo] | [alta/media/baja] | [cómo reducirlo] |

### Preguntas abiertas

> Lo que todavía no sabemos y necesitamos validar.

- [ ] [Pregunta 1]
- [ ] [Pregunta 2]

### Próximos pasos

1. [Acción concreta]
2. [Acción concreta]
3. Escribir ADR-001 sobre [decisión más urgente]

---

## Historial

| Fecha | Actividad | Participantes |
|---|---|---|
| YYYY-MM-DD | [qué se hizo: entrevista, workshop, revisión] | [quiénes] |

---

**Referencia**: [`playbook/15-domain-discovery.md`](../../playbook/15-domain-discovery.md)
