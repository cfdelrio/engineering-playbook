# 09 — Build & CI

> El build es el primer juez. Si el build no confía en el código, nosotros tampoco.

## Principios

1. **El build es reproducible.** Mismo input, mismo output, en cualquier máquina. Nada de "en la mía funciona".
2. **El build es rápido.** Un build lento es una gate que la gente aprende a saltarse.
3. **El build es la verdad.** Si pasa local pero falla en CI, gana CI. Investigá la diferencia.
4. **Verde o nada.** `main` siempre con el build verde. Un `main` roto bloquea a todo el equipo.

## Pipeline de CI

Toda PR pasa, como mínimo, por estas etapas — en este orden, fallando rápido:

```
1. Install        ← dependencias deterministas (lockfile commiteado)
2. Lint + Format  ← estilo y reglas estáticas
3. Type check     ← tipos sin errores
4. Test           ← unitarios + integración
5. Build          ← artefacto compilado / empaquetado
6. Security scan  ← secretos y vulnerabilidades conocidas
```

Si cualquier etapa falla, la PR no se mergea. Sin excepciones manuales.

## Reglas de configuración

1. **Lockfiles commiteados.** Builds deterministas exigen dependencias pinneadas.
2. **Cero warnings tolerados** en lo que controlamos. Un warning ignorado es el primero de mil.
3. **El mismo comando local y en CI.** Lo que corre CI debe poder correrse local (`make ci`, `npm run ci`, etc.). No hay magia exclusiva del pipeline.
4. **Cachear lo caro, no lo correcto.** El cache acelera; nunca debe cambiar el resultado.

## Velocidad

Optimizamos el camino crítico del feedback:

- Paralelizar etapas independientes.
- Cachear dependencias y artefactos intermedios.
- Correr primero lo que falla rápido y barato (lint antes que E2E).

## Relación con las quality gates

CI es la **automatización** de las [quality gates de la Constitution](../CONSTITUTION.md#artículo-4--quality-gates). Las gates definen el qué; CI lo hace cumplir sin depender de la memoria de nadie.

---

Anterior: [`08-code-review.md`](./08-code-review.md) · Siguiente: [`10-deployment.md`](./10-deployment.md)
