# 02 — Principios de Ingeniería

> Los principios son el "cómo decidimos" cuando las reglas no alcanzan.

## Principios rectores

### 1. Architecture First
Decidimos la forma del sistema antes de llenarlo de código. La estructura es una decisión, no un residuo. Ver [`03-architecture.md`](./03-architecture.md).

### 2. Domain Driven
El código habla el idioma del negocio. Los límites siguen al dominio. Ver [`04-domain-driven-design.md`](./04-domain-driven-design.md).

### 3. Spec Driven
Primero definimos *qué* y *por qué*; después *cómo*. Ver [`05-spec-driven-development.md`](./05-spec-driven-development.md).

### 4. Simple antes que fácil
Lo fácil es lo que cuesta poco hoy. Lo simple es lo que cuesta poco *siempre*. Elegimos lo simple aunque cueste más hoy.

### 5. Hacelo reversible
Cambios pequeños, desplegables y reversibles. Un cambio que no se puede revertir es un riesgo que no se puede gestionar.

### 6. Explícito sobre implícito
Magia mínima. Dependencias, efectos y contratos visibles. El lector no debería tener que adivinar.

### 7. Optimizá para lectura
El código se lee muchas más veces de las que se escribe. Escribimos para el que viene después (que muchas veces somos nosotros).

### 8. Borrá con gusto
El mejor código es el que no existe. Menos superficie = menos bugs, menos mantenimiento, menos contexto.

### 9. Falla fuerte y temprano
Validamos en el borde. Un error que explota cerca de su causa cuesta minutos; uno que se filtra cuesta días.

### 10. La consistencia es una feature
Código nuevo que se parece al de al lado. La sorpresa es cara. Un patrón mediocre y consistente le gana a diez patrones brillantes y dispersos.

## Cómo se usan

Cuando dos caminos parecen válidos, ganan estos principios en orden. Si dos principios chocan, el conflicto se resuelve explícitamente — en la PR o en un ADR — nunca en silencio.

---

Anterior: [`01-product.md`](./01-product.md) · Siguiente: [`03-architecture.md`](./03-architecture.md)
