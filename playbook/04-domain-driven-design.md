# 04 — Domain Driven Design

> El código habla el idioma del negocio. Si el negocio dice "carrera", el código dice `Race`, no `EventTypeB`.

## La idea central

El software complejo se domina modelando el **dominio** — el problema real del negocio — y dejando que ese modelo gobierne el código. La tecnología sirve al modelo, no al revés.

## Lenguaje ubicuo (Ubiquitous Language)

1. Hay **un solo** vocabulario, compartido entre negocio y código.
2. Los nombres del código son los nombres del negocio. Sin traducción mental.
3. Cuando el negocio inventa o redefine un término, el código lo sigue.

> Si en una reunión decís "atleta" y en el código se llama `User`, tenés una fuga de lenguaje. Arreglala.

## Bloques de construcción

| Concepto | Qué es | Regla |
|---|---|---|
| **Entidad** | Tiene identidad propia que persiste en el tiempo. | Se compara por id, no por valor. |
| **Value Object** | Definido por sus atributos, sin identidad. | Inmutable. `Distance(10, KM)`. |
| **Aggregate** | Grupo de entidades/VOs con una raíz que garantiza invariantes. | Se modifica solo a través de la raíz. |
| **Repository** | Da acceso a aggregates como si fueran una colección. | Abstrae la persistencia. |
| **Domain Service** | Lógica de dominio que no pertenece a una entidad. | Sin estado. |
| **Domain Event** | Algo relevante que pasó en el dominio. | En pasado: `WorkoutCompleted`. |

## Bounded Contexts

Un mismo término puede significar cosas distintas en partes distintas del sistema. Un "usuario" en facturación no es un "usuario" en entrenamiento.

1. Cada **bounded context** tiene su propio modelo y su propio lenguaje, coherente puertas adentro.
2. Los contextos se comunican por **contratos explícitos** (APIs, eventos), nunca compartiendo el modelo interno.
3. El mapa de contextos (context map) se documenta — quién depende de quién y cómo.

## Reglas de oro

1. **La lógica de dominio no depende de frameworks.** Nada de imports de ORM o HTTP en el corazón del dominio.
2. **Las invariantes viven en el aggregate.** Un aggregate nunca debería poder quedar en estado inválido.
3. **Modelá comportamiento, no datos.** Un dominio anémico (puros getters/setters) es una base de datos disfrazada.
4. **El modelo evoluciona.** Cuando aprendés algo nuevo del negocio, refactorizá el modelo. El modelo desactualizado miente.

## Proceso

1. Hablá con el negocio. Escuchá los sustantivos y verbos que repiten.
2. Construí un **domain model** (`domain-model.md` en el proyecto) con esos términos.
3. Identificá aggregates, invariantes y eventos.
4. Traducí a código sin perder ni un nombre por el camino.

Ejemplo real: [`examples/aurora/docs/domain-model.md`](../examples/aurora/docs/domain-model.md).

---

Anterior: [`03-architecture.md`](./03-architecture.md) · Siguiente: [`05-spec-driven-development.md`](./05-spec-driven-development.md)
