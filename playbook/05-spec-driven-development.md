# 05 — Spec Driven Development

> Primero escribimos *qué* vamos a construir y *cómo sabremos que funciona*. Recién después, *cómo*.

## Por qué specs

Escribir una spec es **pensar antes de teclear**. Obliga a entender el problema, exponer supuestos y acordar el "listo" antes de invertir en la implementación. Una buena spec ahorra días de código mal dirigido.

Además, en un mundo de **AI Assisted Engineering**, la spec es el mejor input que le podés dar a Claude Code. Una spec clara produce implementación clara; una spec vaga produce código vago a gran velocidad.

## El flujo

```
Problema  →  Feature Spec  →  ADR (si toca arquitectura)  →  Implementación  →  Tests contra criterios de aceptación  →  Review
```

1. **Problema** — qué duele y a quién.
2. **Feature Spec** — usando el [template](../templates/feature-spec-template.md).
3. **ADR** — si la feature requiere una decisión estructural.
4. **Implementación** — guiada por la spec, no por la intuición del momento.
5. **Verificación** — los tests prueban los criterios de aceptación de la spec.
6. **Review** — se revisa contra la spec, no contra el gusto del revisor.

## Qué tiene una buena spec

Una feature spec mínima viable contiene:

- **Contexto y problema** — por qué existe esto.
- **Objetivo** — qué resultado buscamos (medible si se puede).
- **No-objetivos** — qué explícitamente *no* hace, para acotar.
- **Comportamiento** — el qué, en escenarios concretos.
- **Criterios de aceptación** — condiciones verificables de "listo".
- **Consideraciones** — riesgos, edge cases, impacto en seguridad/datos.
- **Preguntas abiertas** — lo que todavía no sabemos.

Detalle completo en el [template de feature spec](../templates/feature-spec-template.md).

## Reglas

1. **No hay feature no trivial sin spec.** "No trivial" = más de un par de horas, o toca varios módulos, o cambia comportamiento observable.
2. **La spec es viva.** Si la implementación revela que la spec estaba mal, se corrige la spec, no se la abandona.
3. **Criterios de aceptación = tests.** Si un criterio no se puede verificar, está mal escrito.
4. **La spec precede al código, no lo documenta después.** Una spec escrita post-mortem es documentación, no diseño.

## Specs y tamaño

No toda tarea necesita una spec de tres páginas. Calibrá:

| Tamaño | Qué necesita |
|---|---|
| Trivial (fix, typo, ajuste menor) | Nada formal. Buen mensaje de commit. |
| Pequeña | Descripción en la PR con criterios de aceptación. |
| Mediana / grande | Feature spec completa. |
| Estructural | Feature spec + ADR. |

---

Anterior: [`04-domain-driven-design.md`](./04-domain-driven-design.md) · Siguiente: [`06-engineering.md`](./06-engineering.md)
