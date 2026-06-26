# 11 — Observabilidad

> Lo que no se puede observar, no está en producción de verdad: está en producción de fe.

## Por qué

No podemos arreglar lo que no vemos, ni mejorar lo que no medimos. La observabilidad es la diferencia entre "creo que está bien" y "sé que está bien". Se diseña con el sistema, no se agrega cuando ya está ardiendo.

## Los tres pilares

| Pilar | Responde | Default |
|---|---|---|
| **Logs** | ¿Qué pasó exactamente? | Estructurados (JSON), con contexto. |
| **Métricas** | ¿Cómo se comporta en agregado? | Por camino crítico, con dimensiones útiles. |
| **Trazas** | ¿Por dónde pasó la request? | En flujos distribuidos / multi-servicio. |

## Logs

1. **Estructurados, no texto suelto.** Cada log es un evento con campos consultables.
2. **Con contexto.** request id, user id (sin PII sensible), operación. Un log sin contexto es ruido.
3. **Niveles con criterio.** `error` es algo que requiere acción; no inundes de `error` lo que es esperado.
4. **Nunca loguees secretos ni datos personales sensibles.** Ver [`12-security.md`](./12-security.md).

## Métricas

Como base, instrumentamos las **golden signals** en cada camino crítico:

- **Latencia** — cuánto tarda.
- **Tráfico** — cuánta demanda.
- **Errores** — qué proporción falla.
- **Saturación** — qué tan lleno está el recurso.

Más métricas de negocio según el producto (ej: imports procesados, pronósticos enviados, conversiones).

## Trazas

En operaciones que cruzan varios componentes, una traza muestra el camino completo de una request y dónde se fue el tiempo. Imprescindible para debuggear latencia distribuida.

## Alertas

1. **Alertá sobre síntomas, no sobre causas.** "Los usuarios reciben errores" > "la CPU está al 80%".
2. **Toda alerta es accionable.** Si no hay nada que hacer, no es una alerta: es ruido que entrena a ignorar.
3. **Las alertas tienen dueño y runbook.** Quién responde y qué hace primero.

## Regla de diseño

Cuando construyas una feature, preguntá: **"si esto falla en producción a las 3am, ¿con qué lo voy a diagnosticar?"** Si la respuesta es "con nada", todavía no terminaste.

---

Anterior: [`10-deployment.md`](./10-deployment.md) · Siguiente: [`12-security.md`](./12-security.md)
