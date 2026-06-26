# AURORA — Modelo de Dominio

> Ejemplo de aplicación de [`playbook/04-domain-driven-design.md`](../../../playbook/04-domain-driven-design.md). Este modelo es el lenguaje ubicuo de AURORA: el código DEBE usar estos nombres.

## Lenguaje ubicuo

| Término | Significado |
|---|---|
| **Athlete** (Atleta) | La persona que entrena. Dueña de sus datos. Tiene un perfil fisiológico. |
| **Activity** (Actividad) | Una sesión de entrenamiento registrada (una salida en bici, una corrida). |
| **Sample** (Muestra) | Un punto en el tiempo dentro de una actividad: potencia, FC, cadencia, posición, etc. |
| **Stream** (Serie) | La secuencia de muestras de una métrica a lo largo de la actividad (ej. serie de potencia). |
| **Metric** (Métrica) | Un valor derivado del análisis de una actividad (ej. potencia normalizada). |
| **Load** (Carga) | El estrés de entrenamiento acumulado en una ventana de tiempo. |
| **Form** (Forma) | El estado actual del atleta como balance entre carga aguda y crónica. |
| **Import** | El proceso de incorporar una actividad desde un archivo externo (FIT). |
| **Engine** (Motor) | El subsistema que procesa una actividad y produce sus métricas. |

> Regla: si el negocio dice "actividad", el código dice `Activity`, nunca `Workout`, `Session` ni `EventTypeA`.

## Aggregates

### Athlete (raíz)
Garantiza la coherencia del perfil del atleta y la propiedad de sus actividades.
- Contiene: perfil fisiológico (umbrales, zonas), preferencias.
- Invariante: las zonas de entrenamiento derivan de umbrales válidos y consistentes.

### Activity (raíz)
Representa una sesión registrada y sus datos.
- Contiene: metadata (deporte, fecha, duración), los **Streams** de muestras, y las **Metrics** calculadas.
- Invariante: una actividad procesada siempre tiene streams normalizados; las métricas solo existen tras un procesamiento válido.
- Se modifica únicamente a través de su raíz (no se tocan los streams por fuera).

## Value Objects

- **Power(value, unit)** — potencia, inmutable.
- **HeartRate(bpm)** — ritmo cardíaco.
- **Duration**, **Distance**, **Cadence**, **GeoPoint(lat, lon)**.
- **TrainingZones** — derivado del perfil, define los rangos de intensidad.

Los value objects son inmutables y se comparan por valor.

## Domain Events

Eventos relevantes, nombrados en pasado:

- `ActivityImported` — una actividad entró al sistema y fue normalizada.
- `ActivityAnalyzed` — el motor terminó de calcular las métricas.
- `AthleteProfileUpdated` — cambiaron umbrales/zonas (puede requerir recálculo).

## Bounded Contexts

| Contexto | Responsabilidad |
|---|---|
| **Ingestion** | Importar y normalizar datos crudos (FIT → streams). |
| **Analysis** | El motor: streams → métricas con contexto. |
| **Athlete** | Perfil, umbrales, zonas, identidad del atleta. |

Los contextos se comunican por **eventos y contratos explícitos**, nunca compartiendo modelos internos. Ej.: Ingestion publica `ActivityImported`; Analysis reacciona y produce `ActivityAnalyzed`.

## Reglas de dominio destacadas

1. El cálculo de métricas (Analysis) **no depende** del formato de origen (FIT). Eso vive en Ingestion. El motor trabaja sobre streams normalizados, agnósticos del dispositivo.
2. Las **TrainingZones** de un atleta son la base de casi toda interpretación: cambiarlas invalida análisis previos (de ahí el evento `AthleteProfileUpdated`).
3. Un `Stream` puede tener huecos (datos faltantes del dispositivo); el dominio debe tratar el dato faltante como un caso de primera clase, no como un error.
