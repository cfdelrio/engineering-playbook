# Feature Spec — AURORA Engine (motor de análisis)

> Ejemplo de [feature spec](../../../templates/feature-spec-template.md) aplicada a un subsistema central. Ilustra [`playbook/05-spec-driven-development.md`](../../../playbook/05-spec-driven-development.md).

| Campo | Valor |
|---|---|
| **Estado** | Aprobada (ejemplo) |
| **Autor** | C. del Río |
| **Fecha** | 2026-06-26 |
| **Producto** | AURORA |
| **ADRs relacionados** | ADR-0003 (motor agnóstico del dispositivo) |

## 1. Contexto y problema

Una vez que una actividad fue importada y normalizada ([fit-import-spec](./fit-import-spec.md)), tenemos streams de muestras crudas. Pero el atleta no quiere streams: quiere **métricas que signifiquen algo**. Necesitamos un subsistema que transforme streams normalizados en métricas de rendimiento con contexto.

## 2. Objetivo

Dado una actividad con streams normalizados, el **Engine** produce un conjunto de métricas de rendimiento, de forma determinista y agnóstica del dispositivo de origen.

## 3. No-objetivos

- No importa ni parsea archivos (eso es Ingestion).
- No genera recomendaciones de entrenamiento (fase posterior).
- No persiste nada por sí mismo: recibe datos y devuelve métricas.

## 4. Usuarios y casos de uso

- **Atleta** que tras subir una actividad espera ver su resumen de rendimiento.
- **Sistema** que reacciona a `ActivityImported` para disparar el análisis.

## 5. Comportamiento esperado

```
Dado una Activity con streams normalizados (potencia, FC, tiempo)
Cuando el Engine la procesa
Entonces calcula sus Metrics y emite ActivityAnalyzed

Dado una Activity con huecos en el stream de potencia
Cuando el Engine la procesa
Entonces trata los huecos según la política definida (no rompe) y marca la métrica como parcial

Dado un Athlete sin TrainingZones definidas
Cuando el Engine intenta una métrica que las requiere
Entonces produce las métricas independientes de zonas y omite las dependientes, sin fallar
```

Métricas de la primera versión (ilustrativas): potencia normalizada, carga de la sesión, distribución por zonas, intensidad relativa.

## 6. Criterios de aceptación

- [ ] Procesar la misma actividad dos veces produce **exactamente** las mismas métricas (determinismo).
- [ ] El Engine funciona idéntico sin importar el dispositivo de origen (agnóstico).
- [ ] Streams con huecos no rompen el procesamiento; la métrica afectada se marca como parcial.
- [ ] Si faltan TrainingZones, se calculan las métricas posibles y se omiten las dependientes, sin error.
- [ ] El Engine no accede a base de datos ni a red: entra Activity, sale Metrics.
- [ ] Tras un análisis exitoso se emite `ActivityAnalyzed`.

## 7. Modelo de dominio afectado

Toca `Activity` (le agrega `Metrics`), consume `Stream`/`Sample`, usa `TrainingZones` del `Athlete`. Emite `ActivityAnalyzed`. Ver [`domain-model.md`](./domain-model.md).

## 8. Consideraciones

- **Arquitectura:** el Engine es lógica de dominio pura (contexto Analysis). Sin dependencias de infraestructura → testeable de forma aislada (ADR-0003).
- **Performance:** el procesamiento debe escalar a actividades largas (horas de muestras por segundo).
- **Observabilidad:** registrar duración del análisis y métricas marcadas como parciales.
- **Reversibilidad:** versionar el algoritmo del Engine; recalcular es posible porque los streams se conservan.

## 9. Preguntas abiertas

- ¿Política exacta para huecos: interpolar, ignorar, o ambas según la métrica?
- ¿Recalculamos automáticamente las actividades viejas cuando cambia el algoritmo o solo bajo demanda?
