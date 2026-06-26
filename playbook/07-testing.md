# 07 — Testing & Calidad

> Los tests no son una tarea aparte. Son parte de escribir el código.

## Filosofía

Testeamos para **tener confianza para cambiar**. Un buen test suite es lo que te deja refactorizar sin miedo y desplegar el viernes. No testeamos para subir un número de cobertura; testeamos comportamiento que importa.

## La pirámide

```
        /\        E2E / Acceptance   ← pocos, lentos, alto valor de confianza
       /  \
      /    \      Integración        ← límites reales: DB, APIs, contratos
     /      \
    /________\    Unitarios          ← muchos, rápidos, lógica de dominio
```

1. **Muchos unitarios** sobre la lógica de dominio — rápidos y sin dependencias.
2. **Integración** en los límites — que la pieza realmente habla con la DB / API.
3. **Pocos E2E** sobre los caminos críticos del usuario.

## Reglas

1. **Toda lógica de dominio tiene tests unitarios.** Es la parte que más cuesta debuggear en producción.
2. **Los tests prueban comportamiento, no implementación.** Si un refactor que no cambia el comportamiento rompe los tests, los tests están mal.
3. **Los criterios de aceptación de la spec se convierten en tests.** Trazabilidad de spec → test.
4. **Un test que falla debe decir por qué.** Mensajes y asserts claros. Un test rojo es un diagnóstico, no un misterio.
5. **Tests deterministas.** Nada de flakiness por tiempo, orden o red. Un test flaky se arregla o se borra.
6. **Arrange–Act–Assert.** Estructura legible en cada test.

## Qué testear (y qué no)

| Sí | No (o con moderación) |
|---|---|
| Lógica de dominio y reglas de negocio | Getters/setters triviales |
| Edge cases y caminos de error | Código de framework de terceros |
| Invariantes de aggregates | Detalles de implementación privada |
| Contratos entre componentes | Mocks que prueban que el mock funciona |
| Caminos críticos del usuario (E2E) | UI pixel-perfect |

## Cobertura

La cobertura es una **señal, no una meta**. Buscamos cubrir la lógica que importa, no llegar a un porcentaje mágico. 100% de cobertura con tests que no afirman nada es 0% de confianza.

Regla práctica: **toda lógica nueva llega con sus tests en la misma PR.** No "después".

## Tests y IA

Cuando Claude Code escribe código, escribe sus tests. Y los tests generados se revisan con el mismo rigor: un test que pasa pero no afirma lo correcto es peor que no tener test, porque da falsa confianza.

---

Anterior: [`06-engineering.md`](./06-engineering.md) · Siguiente: [`08-code-review.md`](./08-code-review.md)
