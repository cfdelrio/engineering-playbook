# AURORA — Visión de Producto

> Ejemplo de aplicación de [`playbook/01-product.md`](../../../playbook/01-product.md).

## El usuario

**Atleta de resistencia comprometido.** Entrena 4-10 veces por semana en ciclismo, running o triatlón. Usa un dispositivo (Garmin, Wahoo, reloj GPS) que registra cada sesión. Quiere mejorar y le importan los datos, pero no es fisiólogo ni tiene tiempo para volverse uno.

## El problema (a fondo)

1. **Datos sin síntesis.** Las apps actuales muestran métricas crudas; el atleta tiene que interpretarlas solo.
2. **Sin contexto histórico real.** Un valor aislado no dice nada; lo que importa es la tendencia y la carga acumulada.
3. **Fragmentación.** Datos de distintos dispositivos y apps que no conversan.

## La propuesta de valor

AURORA convierte datos crudos de actividad en **decisiones de entrenamiento**:

- Importa y normaliza datos de cualquier dispositivo (vía archivos FIT).
- Calcula métricas de rendimiento con contexto histórico (carga, forma, progreso).
- Presenta conclusiones accionables, no solo gráficos.

## Objetivos del producto

| Objetivo | Cómo lo medimos |
|---|---|
| El atleta entiende su estado de forma | Uso recurrente del resumen post-actividad |
| Las conclusiones cambian decisiones | Acciones tomadas a partir de recomendaciones |
| Importar es invisible | Tiempo y fricción del flujo de import |

## No-objetivos (por ahora)

- No somos una red social de atletas.
- No reemplazamos al entrenador humano de elite.
- No hacemos planificación automática de temporadas (todavía).

## Métricas norte

1. **Atletas activos semanales** que importan al menos una actividad.
2. **Tasa de retorno** al resumen de análisis tras cada actividad.

## Capacidades centrales

```
Importar (FIT)  →  Normalizar  →  Motor de análisis  →  Métricas con contexto  →  Decisiones
```

Cada una de estas capacidades se especifica en su propia feature spec. Ver [`aurora-engine-spec.md`](./aurora-engine-spec.md) (el motor) y [`fit-import-spec.md`](./fit-import-spec.md) (el import).

## Roadmap conceptual

- **Fase 1 — Fundamentos:** import confiable + métricas base con contexto.
- **Fase 2 — Insight:** detección de tendencias y recomendaciones.
- **Fase 3 — Anticipación:** predicción de forma y prevención de sobreentrenamiento.
