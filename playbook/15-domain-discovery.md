# 15 — Domain Discovery

> Cómo descubrir un dominio complejo antes de diseñar software.

---

## El problema que resuelve

El error más caro en software no es un bug. Es construir el modelo equivocado.

Un modelo equivocado no falla estrepitosamente — compila, funciona, pasa los tests. Falla lentamente: acumula complejidad accidental, contradice al negocio, require refactors que nunca terminan.

El origen suele ser el mismo: empezamos modelando **entidades** antes de entender **decisiones**.

Domain Discovery es el proceso de entender un dominio desde las decisiones hacia las entidades, no al revés.

---

## Decision Driven Design (DDD²)

> El dominio no nace de entidades. Nace de las decisiones que queremos mejorar.

DDD² es un **método de descubrimiento**. No es un reemplazo del Domain Driven Design — es lo que hacés *antes* de aplicarlo.

### Qué es y qué no es

DDD² responde una pregunta que el DDD clásico asume resuelta: **¿cómo sabemos qué dominio estamos modelando?**

El DDD clásico da herramientas excelentes para diseñar software una vez que entendés el dominio. DDD² es el proceso de llegar a ese entendimiento.

| | DDD² | DDD |
|---|---|---|
| **Tipo** | Método de descubrimiento | Metodología de diseño |
| **Pregunta central** | ¿Qué decisiones toman los expertos? | ¿Cómo modelamos ese conocimiento en software? |
| **Entrada** | Expertos del dominio, observación, entrevistas | Conocimiento de dominio ya entendido |
| **Salida** | Mapa de decisiones, lenguaje candidato, boundaries candidatos | Entidades, aggregates, bounded contexts implementados |
| **Cuándo ocurre** | Antes de diseñar | Después de descubrir |

DDD² produce los insumos que DDD necesita para funcionar bien.

### Por qué importa la secuencia

Los expertos del dominio no piensan en objetos. Piensan en situaciones, juicios y consecuencias. Cuando le preguntás a un entrenador "¿qué es un entrenamiento?", te da una definición genérica. Cuando le preguntás "¿cuándo le decís a un atleta que descanse en lugar de entrenar?", te revela el conocimiento real del dominio.

Las decisiones son el punto de acceso al conocimiento experto. Sin ese acceso, el DDD opera sobre suposiciones.

### Relación con el resto del playbook

```
DDD²                  →   ¿Qué decisiones queremos mejorar?
                               ↓
Domain Driven Design  →   ¿Qué modelo representa ese conocimiento?
                               ↓
Architecture First    →   ¿Qué arquitectura soporta ese modelo?
                               ↓
Spec Driven Dev       →   ¿Cómo especificamos cada feature de ese modelo?
```

Cada capa asume que la anterior está resuelta. Empezar por Architecture First sin Discovery produce arquitecturas elegantes para el dominio equivocado.

---

## Cuándo usar Domain Discovery

**Usarlo cuando:**
- El dominio tiene conocimiento experto no trivial (médico, deportivo, financiero, legal)
- Hay ambigüedad sobre los conceptos centrales del sistema
- Hay múltiples stakeholders con visiones distintas del dominio
- El equipo no tiene experiencia previa en ese dominio
- Se está rediseñando un sistema que acumuló deuda conceptual

**No usarlo cuando:**
- El dominio es bien conocido y ya existe un modelo validado
- Es un CRUD simple sin lógica de negocio real
- El tiempo disponible no permite iteración (mejor usar el template mínimo)
- Ya existe un bounded context establecido y sólo se agrega una feature nueva

---

## Las 8 fases

---

### Fase 1 — Problem Discovery

**Objetivo**: Entender el problema real antes de inventar soluciones.

**Entradas**:
- Descripción inicial del producto o feature
- Acceso al equipo de producto o a los stakeholders
- Observación directa del problema (entrevistas, shadowing, logs existentes)

**Salidas**:
- Descripción del problema en 1-2 oraciones
- Lista de quién sufre el problema y cómo
- Criterio de éxito: ¿cómo se ve el mundo si el problema está resuelto?
- Lista inicial de suposiciones que necesitan validación

**Preguntas guía**:
- ¿Quién tiene este problema y cuándo?
- ¿Cuánto cuesta no resolver esto? (tiempo, dinero, errores, frustración)
- ¿Cómo lo resuelven hoy sin software?
- ¿Qué haría diferente alguien con el problema resuelto?
- ¿Qué problema NO vamos a resolver? (scope)

**Errores comunes**:
- ❌ Confundir el síntoma con el problema: "necesitamos un dashboard" no es un problema, es una solución hipotética.
- ❌ Tomar la descripción inicial del problema como definitiva — los primeros enunciados suelen ser incompletos.
- ❌ Saltar a soluciones antes de validar que el problema existe.

**Definition of Done**:
- [ ] El problema está enunciado sin mencionar soluciones técnicas
- [ ] Hay al menos un ejemplo concreto del problema en la vida real
- [ ] El criterio de éxito es verificable (se puede saber si lo cumplimos)
- [ ] El alcance excluido está documentado

---

### Fase 2 — Decision Discovery

**Objetivo**: Identificar las decisiones que los expertos toman hoy, que el software debería mejorar.

**Entradas**:
- Resultado de Fase 1 (problema definido)
- Acceso a expertos del dominio
- Observación o descripción de su flujo de trabajo actual

**Salidas**:
- Mapa de decisiones: lista de decisiones críticas en el dominio
- Para cada decisión: quién la toma, con qué información, con qué frecuencia
- Decisiones priorizadas por impacto y dificultad actual

**Preguntas guía**:
- ¿Qué juicios importantes tomás en tu trabajo que no son automáticos?
- ¿Qué información necesitás para tomar esa decisión y no siempre tenés?
- ¿Cuándo una decisión te lleva tiempo que no debería?
- ¿Qué decisión, si la tomás mal, tiene consecuencias graves?
- ¿Qué decisiones delegás en otros porque son difíciles o requieren experiencia?
- Si tuvieras el doble de tiempo, ¿qué decisión tomarías mejor?

**Estructura de una decisión:**
```
Decisión: [qué se decide]
Frecuencia: [cada cuánto]
Quien: [rol que decide]
Información actual: [con qué datos]
Información faltante: [qué ayudaría tener]
Costo de error: [qué pasa si se equivoca]
```

**Errores comunes**:
- ❌ Confundir tareas con decisiones: "cargar datos" es una tarea, no una decisión.
- ❌ Documentar sólo decisiones obvias. Las decisiones más valiosas suelen ser las que los expertos hacen "por instinto".
- ❌ No preguntar por el costo del error — revela qué importa realmente.

**Definition of Done**:
- [ ] Al menos 5 decisiones documentadas en el formato de arriba
- [ ] Las decisiones están priorizadas por impacto al usuario/negocio
- [ ] Al menos una decisión es "no obvia" — requiere conocimiento experto
- [ ] El mapa de decisiones fue revisado por el experto de dominio

---

### Fase 3 — Knowledge Discovery

**Objetivo**: Capturar el conocimiento tácito que informar las decisiones. Lo que los expertos saben pero no está escrito.

**Entradas**:
- Mapa de decisiones (Fase 2)
- Acceso continuado a expertos

**Salidas**:
- Por cada decisión crítica: lista de factores que la informan
- Reglas de negocio explícitas ("si X entonces Y")
- Reglas de negocio implícitas ("un atleta que... generalmente...")
- Lista de excepciones y casos borde conocidos por los expertos
- Fuentes de verdad actuales (planillas, herramientas, rituales)

**Preguntas guía**:
- ¿Qué factores considerás para tomar esa decisión?
- ¿Hay reglas que siempre aplican? ¿Cuáles son las excepciones?
- ¿Cuándo una regla no aplica?
- ¿Qué sabés sobre este dominio que no está escrito en ningún lado?
- ¿Qué le enseñarías a alguien nuevo en este rol?
- ¿Qué haría mal un sistema automático que no entiende el contexto?

**Errores comunes**:
- ❌ No documentar las excepciones — el conocimiento experto real vive en los casos borde.
- ❌ Asumir que el experto puede articular su conocimiento fácilmente. A menudo no puede: hay que observar, no sólo preguntar.
- ❌ Mezclar conocimiento de dominio con restricciones de sistema (lo que el sistema actual no permite no es conocimiento de dominio).

**Definition of Done**:
- [ ] Al menos 10 reglas de negocio documentadas (explícitas e implícitas)
- [ ] Al menos 3 casos borde o excepciones documentados
- [ ] Las fuentes de verdad actuales están identificadas
- [ ] Un experto revisó que el conocimiento capturado es correcto

---

### Fase 4 — Language Discovery

**Objetivo**: Construir el vocabulario del dominio. El lenguaje ubicuo que el código usará.

**Entradas**:
- Mapa de decisiones y conocimiento (Fases 2-3)
- Entrevistas y materiales del dominio
- Documentación existente si hay

**Salidas**:
- Lista de términos clave con definición exacta
- Lista de términos que parecen iguales pero son distintos
- Lista de términos que distintos actores usan de forma diferente
- Términos prohibidos (sinónimos que confunden)
- Primer borrador del lenguaje ubicuo

**Preguntas guía**:
- ¿Qué palabras usás que un recién llegado no entendería?
- ¿Hay términos que vos y tu equipo usan distinto?
- ¿Hay términos técnicos que el negocio llama diferente?
- Si tuvieras que explicarle a alguien nuevo en 1 minuto, ¿qué términos explicarías primero?
- ¿Qué palabras se usan de forma ambigua en tu industria?

**Formato de término:**
```
Término: [nombre exacto, en el idioma del experto]
Definición: [qué significa en este dominio específico]
No es: [qué confunde gente que no es del dominio]
Sinónimos prohibidos: [palabras que parecen iguales pero no lo son]
Ejemplo: [instancia concreta del concepto]
```

**Errores comunes**:
- ❌ Traducir los términos del dominio al inglés arbitrariamente. Si el experto dice "Forma", el código dice `Form`, no `Shape`, `State` o `Condition`.
- ❌ Normalizar la ambigüedad: si "entrenamiento" significa cosas distintas para el coach y el atleta, son dos conceptos, no uno con un nombre.
- ❌ No documentar los términos prohibidos — con el tiempo, los sinónimos reaparecen.

**Definition of Done**:
- [ ] Al menos 10 términos definidos en el formato de arriba
- [ ] Los términos ambiguos están desambiguados (o marcados como "en resolución")
- [ ] Los sinónimos prohibidos están listados
- [ ] Un experto validó las definiciones

---

### Fase 5 — Concept Discovery

**Objetivo**: Identificar los conceptos del dominio y clasificarlos: ¿qué tiene identidad propia? ¿Qué es sólo un valor? ¿Qué es una política?

**Entradas**:
- Lenguaje ubicuo (Fase 4)
- Conocimiento de dominio (Fase 3)
- Decisiones del dominio (Fase 2)

**Salidas**:
- Lista de conceptos clasificados por tipo:
  - **Entidades**: conceptos con identidad propia que cambian con el tiempo
  - **Value Objects**: conceptos que describen sin tener identidad propia
  - **Políticas / Reglas**: cómo se comporta el sistema en distintas situaciones
  - **Eventos**: cosas que suceden y tienen consecuencias en el dominio
  - **Roles**: actores que participan en el dominio
- Relaciones iniciales entre conceptos

**Preguntas guía**:
- ¿Este concepto importa *cuál* es (identidad) o sólo *qué valor tiene*?
- ¿Este concepto cambia a lo largo del tiempo?
- ¿Podría existir dos instancias de este concepto con los mismos datos pero que sean "distintas"?
- ¿Este concepto *hace* algo o sólo *describe* algo?
- ¿Este concepto tiene consecuencias en el sistema cuando cambia?

**Errores comunes**:
- ❌ Modelar todo como entidad — no todo necesita identidad.
- ❌ Confundir roles de usuario con conceptos del dominio.
- ❌ Modelar las restricciones del sistema actual en lugar del dominio real.

**Definition of Done**:
- [ ] Todos los conceptos del lenguaje ubicuo están clasificados
- [ ] Los conceptos ambiguos están marcados con la ambigüedad explicitada
- [ ] Al menos 3 eventos del dominio están identificados
- [ ] Un experto validó que los conceptos tienen sentido

---

### Fase 6 — Relationship Discovery

**Objetivo**: Entender cómo los conceptos se relacionan, dependen y afectan entre sí.

**Entradas**:
- Conceptos clasificados (Fase 5)
- Conocimiento de dominio (Fase 3)

**Salidas**:
- Mapa de relaciones entre conceptos
- Dependencias explícitas (A necesita B para calcularse)
- Causalidades (cuando A cambia, B se recalcula/invalida)
- Agregados: grupos de conceptos que siempre se tratan juntos
- Invariantes: reglas que no se pueden violar (el sistema siempre garantiza X)

**Preguntas guía**:
- ¿Qué necesitás saber para calcular X?
- Si Y cambia, ¿qué más se ve afectado?
- ¿Hay conceptos que siempre aparecen juntos?
- ¿Hay conceptos que nunca pueden separarse?
- ¿Qué reglas son absolutas (nunca se viola)?
- ¿Qué garantía debe dar el sistema siempre?

**Errores comunes**:
- ❌ Modelar todas las relaciones como bidireccionales — la mayoría son unidireccionales.
- ❌ No identificar los invariantes — son las reglas más importantes para el diseño.
- ❌ Confundir dependencia con asociación. Que A y B existan juntos no significa que A necesite B para existir.

**Definition of Done**:
- [ ] Los conceptos principales tienen sus relaciones documentadas
- [ ] Al menos 3 invariantes del dominio están identificados
- [ ] Los agregados candidatos están identificados
- [ ] Las causalidades más importantes están explicitadas

---

### Fase 7 — Domain Boundaries

**Objetivo**: Identificar dónde termina un contexto y dónde empieza otro. Qué cruza fronteras y cómo.

**Entradas**:
- Mapa de relaciones (Fase 6)
- Mapa de decisiones (Fase 2)
- Conocimiento del dominio (Fase 3)

**Salidas**:
- Bounded contexts candidatos con nombre y responsabilidad
- Context map: cómo se relacionan los bounded contexts
- Contratos entre contextos (qué pasa a través de cada frontera)
- Decisiones sobre lenguaje compartido vs. lenguaje local por contexto

**Señales de que hay un bounded context:**
- Un grupo de decisiones tiene el mismo lenguaje y los mismos expertos
- El mismo término significa cosas distintas en dos grupos de decisiones
- Dos partes del sistema pueden evolucionar independientemente
- Un conjunto de conceptos siempre aparece junto y rara vez cruza hacia otro conjunto

**Preguntas guía**:
- ¿Hay partes del dominio donde las palabras significan cosas distintas?
- ¿Hay equipos o personas que dominan un área pero no la otra?
- ¿Qué partes del sistema podrían cambiar sin afectar a las demás?
- ¿Qué datos cruzan de una parte a la otra y qué forma toman?
- ¿Hay reglas que aplican en un área pero no en otra?

**Errores comunes**:
- ❌ Crear demasiados contextos pequeños — hay que agrupar por cohesión de decisiones, no por granularidad técnica.
- ❌ Crear un solo contexto porque "todo está relacionado" — entonces no hay modelo, hay un monolito conceptual.
- ❌ No definir los contratos entre contextos — los cruces de frontera son el mayor riesgo de acoplamiento.

**Definition of Done**:
- [ ] Al menos 2 bounded contexts candidatos nombrados y descritos
- [ ] La responsabilidad de cada contexto está en una frase
- [ ] Los datos que cruzan fronteras están identificados
- [ ] El context map está bocetado (puede ser texto, no necesita ser diagrama)

---

### Fase 8 — Architecture Discovery

**Objetivo**: Traducir el dominio descubierto en decisiones de arquitectura. Cerrar el ciclo entre el dominio y el software.

**Entradas**:
- Todos los outputs de Fases 1-7
- Restricciones técnicas conocidas (equipo, stack, tiempo)

**Salidas**:
- Decisiones de arquitectura iniciales (candidatos para ADR)
- Mapa de capas por bounded context (domain / application / infrastructure)
- Riesgos técnicos asociados al dominio
- Preguntas abiertas que necesitan validación

**Preguntas guía**:
- ¿Qué parte del dominio es la más compleja y necesita aislarse?
- ¿Qué cambiaría más rápido? ¿Qué cambiaría más lento?
- ¿Hay partes del dominio que son puramente cálculo? ¿Cuáles necesitan persistencia?
- ¿Qué pasaría si el motor de decisiones más crítico fuera reemplazado mañana?
- ¿Qué dependencias técnicas son inevitables? ¿Cuáles son opcionales?

**Errores comunes**:
- ❌ Diseñar la arquitectura antes de entender el dominio — es la razón por la que existe este proceso.
- ❌ Asumir que la arquitectura del sistema existente es la correcta.
- ❌ No documentar los riesgos descubiertos — son el input más valioso para los ADRs.

**Definition of Done**:
- [ ] Al menos 3 decisiones de arquitectura candidatas identificadas
- [ ] Los riesgos técnicos más importantes están documentados
- [ ] Hay al menos un candidato a ADR listo para escribir
- [ ] El equipo tiene claridad sobre qué construir primero

---

## Cómo usar IA en Domain Discovery

La IA no reemplaza al experto. Acelera el proceso.

### Dónde la IA ayuda

**Fase 1 — Problema**: Generar hipótesis de quién más podría tener el problema. Crear preguntas de entrevista. Sintetizar respuestas de múltiples stakeholders.

**Fase 2 — Decisiones**: Generar un árbol de decisiones hipotético para que el experto valide o corrija. Identificar decisiones implícitas ("¿y cómo decidís cuándo hacer X?").

**Fase 3 — Conocimiento**: Detectar contradicciones en el conocimiento capturado. Generar casos borde para que el experto confirme.

**Fase 4 — Lenguaje**: Identificar términos ambiguos. Proponer definiciones para que el experto corrija. Detectar sinónimos no intencionados.

**Fase 5-6 — Conceptos y Relaciones**: Proponer clasificaciones de entidades/VOs para validar. Detectar dependencias circulares. Sugerir invariantes basados en las reglas descritas.

**Fase 7 — Boundaries**: Analizar el mapa de conceptos y proponer agrupaciones. Identificar conceptos que "viven" en dos contextos (señal de tensión).

**Fase 8 — Arquitectura**: Proponer ADRs candidatos. Generar riesgos técnicos basados en el dominio. Contrastar con arquitecturas conocidas para dominios similares.

### Dónde la IA no alcanza

- No puede reemplazar la conversación directa con el experto.
- No puede validar si el conocimiento capturado es correcto.
- No puede decidir qué decisiones del dominio importan más — eso es juicio del equipo.

---

## Resumen ejecutivo para el equipo

```
Domain Discovery no es un workshop de 4 horas.
Es un proceso iterativo de 2-4 semanas.

Cada fase produce un entregable.
Cada entregable se valida con el experto.
El experto es la fuente de verdad.

Al final tenés:
  - Decisiones del dominio documentadas
  - Conocimiento experto capturado
  - Lenguaje ubicuo validado
  - Bounded contexts identificados
  - Decisiones de arquitectura candidatas

Todo esto antes de escribir una línea de código.
```

---

Anterior: [`14-roadmap.md`](./14-roadmap.md) · [Índice](../)
