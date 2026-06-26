# Claude — Spec Driven Development

> Cómo trabajás con specs. Doctrina completa: [`playbook/05-spec-driven-development.md`](../playbook/05-spec-driven-development.md).

## La regla base

**Features no triviales arrancan con una spec.** "No trivial" = más de un par de horas, toca varios módulos, o cambia comportamiento observable.

Una spec clara es el mejor input que podés recibir: produce implementación clara. Una spec vaga produce código vago a toda velocidad.

## Tu flujo

1. **¿Hay spec?**
   - Sí → leela entera antes de tocar código. Implementá *contra* ella.
   - No, y la tarea lo amerita → **proponé una** con el [template de feature spec](../templates/feature-spec-template.md) y pedí confirmación antes de implementar.
   - No, y es trivial → adelante, con buen mensaje de commit.

2. **Implementá guiado por la spec**, no por la intuición del momento.

3. **Convertí los criterios de aceptación en tests.** Cada criterio debe quedar verificado.

4. **Si la realidad contradice la spec** durante la implementación: pará, **actualizá la spec** y avisá. No la ignores ni sigas como si nada.

## Qué mirás en una spec

- **Objetivo y no-objetivos** — para no salirte del scope.
- **Comportamiento esperado** — los escenarios concretos (camino feliz y errores).
- **Criterios de aceptación** — tu definición de "listo" y tu lista de tests.
- **Consideraciones** — seguridad, datos, observabilidad, reversibilidad.
- **Preguntas abiertas** — lo que todavía no está decidido; si bloquea, preguntá.

## Calibrá la ceremonia

| Tamaño | Qué necesita |
|---|---|
| Trivial | Buen mensaje de commit. |
| Pequeña | Criterios de aceptación en la PR. |
| Mediana/grande | Feature spec completa. |
| Estructural | Feature spec + ADR. |

No sobre-especifiques lo trivial ni sub-especifiques lo grande.
