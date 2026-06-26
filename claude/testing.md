# Claude — Testing

> Cómo escribís tests. Doctrina completa: [`playbook/07-testing.md`](../playbook/07-testing.md).

## La regla base

**Toda lógica nueva llega con sus tests en la misma entrega.** Nunca "los tests después". Si escribís comportamiento, escribís cómo se verifica.

## Qué tests escribís

1. **Unitarios** sobre la lógica de dominio — rápidos, sin dependencias externas. Son la mayoría.
2. **Integración** en los límites reales (DB, APIs, contratos) cuando el cambio los toca.
3. **E2E** solo para caminos críticos del usuario — pocos y de alto valor.

## Reglas

1. **Testeá comportamiento, no implementación.** Si un refactor que no cambia el comportamiento rompe el test, el test estaba mal.
2. **Los criterios de aceptación de la spec se vuelven tests.** Trazabilidad spec → test.
3. **Cubrí caminos de error y edge cases**, no solo el camino feliz. Ahí viven los bugs.
4. **Tests deterministas.** Nada de depender de tiempo real, orden de ejecución o red. Cero flakiness.
5. **Arrange–Act–Assert.** Estructura legible.
6. **Un test que falla debe explicar por qué.** Asserts y mensajes claros.

## Qué NO sobre-testeás

Getters/setters triviales, código de frameworks de terceros, detalles privados de implementación, mocks que solo prueban que el mock funciona.

## Cobertura

Es una señal, no una meta. Cubrí la lógica que importa. 100% con tests que no afirman nada es 0% de confianza.

## Tus tests se revisan igual

Un test generado que pasa pero no afirma lo correcto es **peor** que no tener test: da falsa confianza. Asegurate de que cada test realmente falle si el comportamiento se rompe. Si tenés dudas, rompé el código a propósito y verificá que el test lo detecta.
