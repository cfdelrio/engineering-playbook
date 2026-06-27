# AURORA — Domain Discovery

> Aplicación completa de la metodología [`playbook/15-domain-discovery.md`](../../../playbook/15-domain-discovery.md) al dominio de inteligencia de entrenamiento atlético.

| Campo | Valor |
|---|---|
| **Proyecto** | AURORA |
| **Dominio** | Inteligencia de entrenamiento para atletas de resistencia |
| **Iniciado** | 2026-06-01 |
| **Status** | Completado (v1) |
| **Experto(s) de dominio** | Entrenadores de resistencia, atletas amateur avanzados |
| **Equipo de ingeniería** | Carlos del Río (Staff Engineer) |

---

## Fase 1 — Problem Discovery

### El problema

Los atletas de resistencia acumulan datos de entrenamiento pero no pueden convertirlos en mejores decisiones. Tienen números; no tienen entendimiento.

### Quién sufre el problema

| Actor | Cómo lo sufre | Frecuencia | Impacto |
|---|---|---|---|
| Atleta amateur avanzado | Sabe que entrenó mucho/poco, pero no sabe *por qué* su rendimiento varía | Semanal | Alto |
| Atleta de alto rendimiento sin entrenador | Toma decisiones de entrenamiento basándose en sensaciones, no en datos | Diaria | Alto |
| Entrenador con múltiples atletas | Analizar datos de 10+ atletas manualmente es imposible; trabaja con resúmenes incompletos | Diaria | Alto |

### Cómo lo resuelven hoy

Sin AURORA:
- Atletas: miran Strava o Garmin Connect para "ver los números"
- Coaches: reciben reportes PDF/CSV que analizan manualmente en planillas
- El análisis se hace en texto ("sentí las piernas pesadas") o con herramientas aisladas (Training Peaks, WKO5) que requieren conocimiento técnico avanzado para interpretar

El problema no es falta de datos. Es falta de interpretación contextual.

### Criterio de éxito

El atleta cambia una decisión de entrenamiento (carga, descanso, intensidad) basándose en un insight de AURORA que no hubiera tenido solo.

### Fuera del alcance

- No vamos a ser un Garmin o Strava (captura de datos)
- No vamos a reemplazar al entrenador humano
- No vamos a prescribir planes de entrenamiento (al menos no en v1)
- No vamos a gamificar el entrenamiento

### Suposiciones que validar

- [x] Los atletas quieren entender sus datos, no sólo verlos *(validado: diferencia clave entre AURORA y dashboards)*
- [x] El contexto longitudinal importa más que el análisis por sesión *(validado: una sesión aislada no dice nada)*
- [ ] Los entrenadores pagarían por delegar el análisis rutinario a una herramienta *(a validar en mercado)*

---

## Fase 2 — Decision Discovery

### Mapa de decisiones

| Decisión | Frecuencia | Quién | Información actual | Información faltante | Costo de error |
|---|---|---|---|---|---|
| ¿Hoy entreno o descanso? | Diaria | Atleta | Sensación subjetiva, plan de entrenamiento | Estado real de recuperación, carga acumulada | Sobreentrenamiento, lesión, subperformance en competencia |
| ¿Esta sesión fue de calidad suficiente? | Post-sesión | Atleta / Coach | Potencia media, FC, tiempo | Cumplimiento de zonas objetivo, variabilidad, contexto de fatiga | Repetir sesión inútil o acumular deuda de adaptación |
| ¿Estoy listo para competir la próxima semana? | Semanal | Atleta / Coach | Sensación general, volumen de semana | Forma calculada, tendencia de fitness, recuperación | Competir en fatiga, rendir por debajo del potencial |
| ¿Hay que ajustar la carga de este atleta? | Semanal | Coach | Reportes manuales, conversación con atleta | Tendencia de carga/recuperación objetiva | Lesión por sobreentrenamiento, pérdida de adaptación por subentrenamiento |
| ¿Los umbrales del atleta siguen siendo válidos? | Mensual | Coach | Test de FTP / Lactato (si lo tienen) | Señales indirectas de cambio de fitness sin test formal | Zonas de entrenamiento incorrectas invalidan toda la periodización |
| ¿En qué período del año puede alcanzar su pico? | Anual (planning) | Coach | Historial subjetivo, calendario de carreras | Análisis de tendencias de fitness año a año | Plan de temporada mal calibrado |

### Decisiones priorizadas

1. **¿Hoy entreno o descanso?** — Es la decisión más frecuente y la que más impacto tiene en la salud y rendimiento del atleta. Mala respuesta repetida = sobreentrenamiento.
2. **¿Estoy listo para competir?** — Alta consecuencia, pocas oportunidades en el año. El atleta invirtió meses en prepararse para esta ventana.
3. **¿Hay que ajustar la carga?** — Impacto alto para coaches con múltiples atletas; hoy es imposible hacerlo con datos reales para todos.

### Decisiones que el software NO debería tomar

- **¿Debo abandonar la carrera?** — Decisión médica y de seguridad, siempre humana
- **¿Debo cambiar de entrenador?** — Decisión relacional y estratégica
- **¿Vale la pena sufrir para lograr X?** — Decisión de valores personales

---

## Fase 3 — Knowledge Discovery

### Reglas explícitas

| Regla | Condición | Consecuencia | Fuente |
|---|---|---|---|
| **Supercompensación** | Si la carga aguda supera la crónica demasiado rápido | El atleta no se adapta, se estresa | Fisiología deportiva (Banister model) |
| **Zonas por umbral** | Las zonas de entrenamiento se calculan desde el FTP / LTHR del atleta | Entrenar sin umbral correcto = zonas incorrectas | Coaching de resistencia |
| **Ventana de recuperación** | Después de una sesión de alta intensidad, se necesitan 48-72hs para recuperar la capacidad neuromuscular | No repetir esfuerzos máximos en menos de 48hs | Fisiología del ejercicio |
| **Pico de forma** | La forma máxima ocurre cuando el fitness es alto y la fatiga baja | Reducir carga 10-14 días antes de competencia objetivo | Tapering clásico |
| **Datos faltantes del dispositivo** | GPS, FC o potencia pueden tener huecos por señal o batería | El stream existe pero con valores nulos — esto es normal, no un error | Conocimiento de datos de dispositivos |

### Reglas implícitas

| Regla | Descripción | Validado por experto |
|---|---|---|
| **La sensación el día siguiente dice más que la sesión** | Un atleta que entrena bien pero amanece destruido al día siguiente tiene más fatiga de lo que muestran los números | [x] Sí |
| **La FC elevada en reposo es señal de alerta** | Si la FC al despertar sube 5-10bpm sobre el baseline, hay fatiga acumulada o estrés externo | [x] Sí |
| **Los atletas subestiman el cansancio psicológico** | El estrés de vida (trabajo, familia) impacta el rendimiento pero no aparece en los datos de entrenamiento | [x] Sí |
| **El análisis de una sesión sin contexto no dice nada** | Una sesión "mala" en una semana de alta carga es esperada; la misma sesión en recuperación es una señal | [x] Sí |
| **El entrenador mira tendencias, no sesiones** | Un entrenador experimentado no analiza datos de cada sesión — analiza tendencias de semanas y meses | [x] Sí |

### Casos borde y excepciones

| Situación | Por qué es diferente | Qué aplica en cambio |
|---|---|---|
| Atleta enfermo durante la semana | La carga baja, pero no por recuperación — el fitness puede decrecer | No contar como recuperación; marcar período como "no entrenable" |
| Viaje con desfase horario | El rendimiento cae aunque el entrenamiento sea normal | Contextualizar la semana como "desfase" |
| Prueba de FTP fallida | El atleta no pudo dar su máximo en el test | El FTP resultante no es válido; no actualizar umbrales |
| Actividad multideporte (triatlón) | Un triatlón tiene swim+bike+run como una sola sesión o como tres | El sistema debe poder representar la sesión compuesta como una unidad |
| Periodo de puesta en forma inicial | Al inicio de temporada, la "forma" negativa es esperada y deseada | No alertar como problema; contextualizar con el período del año |

### Fuentes de verdad actuales

| Fuente | Tipo | Dueño | Limitación |
|---|---|---|---|
| Garmin / Wahoo | Dispositivo + app | Atleta | Datos crudos; sin interpretación contextual |
| Training Peaks | Herramienta | Atleta / Coach | Requiere conocimiento técnico avanzado; costoso |
| Planillas de Excel del coach | Planilla | Coach | Manual, no escala, no compartible fácilmente |
| Conversación atleta-coach | Ritual (llamada/chat) | Ambos | No persistido; se pierde con el tiempo |
| Sensaciones anotadas en Strava | Texto libre | Atleta | No estructurado; no procesable |

---

## Fase 4 — Language Discovery

### Lenguaje ubicuo de AURORA

| Término | Definición | No es | Sinónimos prohibidos | Ejemplo |
|---|---|---|---|---|
| **Workout** | Una sesión de entrenamiento registrada con datos de dispositivo | Un "plan de entrenamiento" ni una "actividad genérica" | `session`, `training`, `activity`, `event` | Salida de 2hs en bici con datos de potencia |
| **Stream** | La serie temporal de valores de una métrica a lo largo de un Workout | Un único valor ni un promedio | `timeseries`, `data`, `channel` | Serie de potencia: [250w, 248w, 252w, ...] durante 2hs |
| **TrainingLoad** | Estrés de entrenamiento acumulado en una ventana de tiempo (aguda o crónica) | "El volumen de la semana" ni "qué tan duro entrenó" | `load`, `stress`, `volume`, `workload` | CTL (crónico 42 días) = 75, ATL (agudo 7 días) = 90 |
| **Form** | Balance actual del atleta: `Form = Fitness - Fatigue` (TSB en Banister model) | "Cómo se siente el atleta" ni "la forma física general" | `condition`, `state`, `readiness` | Form = -15 (fatiga, normal en bloque de carga) |
| **Fitness** | Adaptación crónica acumulada a lo largo de semanas/meses | "Lo apto que está el atleta" en sentido general | `aerobic base`, `endurance`, `capacity` | CTL de 80 = fitness alto |
| **Fatigue** | Estrés agudo acumulado en los últimos 7 días | "Cansancio del momento" ni "si duerme bien" | `tiredness`, `stress`, `freshness` | ATL de 100 = alta fatiga |
| **TrainingZone** | Rango de intensidad definido por el umbral del atleta | Una categoría genérica de esfuerzo | `zone`, `intensity level`, `effort zone` | Zona 2: 56-75% FTP |
| **ThresholdPower** / FTP | Potencia máxima sostenible durante 1 hora para ese atleta | Una potencia fija universal | `max power`, `threshold` | FTP = 280w |
| **NormalizedWorkout** | Representación de un Workout después de la normalización: streams en formato estándar | El archivo FIT crudo | `parsed workout`, `clean data` | Workout con streams en vatios, lpm, rpm sin dependencia de Garmin |
| **AuroraIndex** | Indicador sintético de estado del atleta producido por AURORA | Un número de rendimiento genérico | `score`, `rating`, `index` | AuroraIndex = 72/100 (forma moderada, fitness creciendo) |
| **CoachInsight** | Recomendación textual generada por AURORA con razonamiento explicitado | Una predicción ni un diagnóstico médico | `recommendation`, `tip`, `alert` | "Tu fatiga supera el fitness esta semana. Considerá una sesión más suave mañana." |
| **RecoveryWindow** | Período post-sesión donde la capacidad de rendimiento está reducida | "Descanso" ni "tiempo libre" | `rest period`, `cooldown`, `recovery time` | RecoveryWindow de 48hs después de sesión de VO2max |

### Términos en disputa

| Término | En el mundo Garmin/Strava | En AURORA | Resolución |
|---|---|---|---|
| "Actividad" | Cualquier cosa registrada (paseo, sueño, steps) | No existe — usamos `Workout` para sesiones de entrenamiento | Usar **Workout** siempre; "actividad" es vocabulario de plataformas genéricas |
| "Training Load" | Volumen × Intensidad (cálculo simple) | TrainingLoad calculado con modelo de Banister (CTL/ATL) | Definición AURORA es más específica; documentar distinción |
| "Forma" | Sensación subjetiva del atleta | `Form = Fitness - Fatigue` (calculado, objetivo) | En AURORA, Form siempre es el valor calculado, no la sensación |

---

## Fase 5 — Concept Discovery

### Entidades

| Entidad | Descripción | Cómo se identifica | Ciclo de vida |
|---|---|---|---|
| **Athlete** | La persona que entrena. Dueña de sus datos y su perfil fisiológico. | ID único en el sistema | Creado al registrarse; el perfil evoluciona (FTP cambia, zonas cambian) |
| **Workout** | Una sesión de entrenamiento registrada | ID único + fecha + atleta | Creado al importar; procesado → normalizado → analizado. Nunca modificado post-análisis |
| **TrainingCycle** | Un bloque de entrenamiento con objetivo específico (ej. "bloque de base 4 semanas") | ID + fechas + atleta | Creado por el coach o inferido; se cierra al completarse |

### Value Objects

| Value Object | Descripción | Atributos | Inmutable |
|---|---|---|---|
| **Stream** | Serie temporal de una métrica en un Workout | `metric`, `values[]`, `timestamps[]`, `gaps[]` | Sí — si cambia, es un nuevo Stream |
| **Power** | Valor de potencia con unidad | `value (int)`, `unit (W)` | Sí |
| **HeartRate** | Frecuencia cardíaca | `value (int)`, `unit (bpm)` | Sí |
| **TrainingZone** | Rango de intensidad del atleta | `number`, `lowerBound`, `upperBound`, `label` | Sí — si cambia el FTP, se crean zonas nuevas |
| **ThresholdPower** | FTP del atleta en un momento dado | `value (W)`, `validFrom`, `validUntil` | Sí — cada FTP es un nuevo ThresholdPower |
| **AuroraIndex** | Índice compuesto de estado | `value (0-100)`, `calculatedAt`, `components` | Sí |
| **TrainingLoad** | Carga de entrenamiento en una ventana | `acute (ATL)`, `chronic (CTL)`, `calculatedAt` | Sí |
| **Form** | Balance fitness-fatiga | `value`, `calculatedAt`, `fitness`, `fatigue` | Sí |

### Eventos de dominio

| Evento | Cuándo ocurre | Consecuencias | Quién lo origina |
|---|---|---|---|
| `WorkoutImported` | Se importó un archivo FIT exitosamente | Triggerea normalización y análisis | Sistema de Ingestion |
| `WorkoutNormalized` | Los streams del Workout están en formato estándar | Triggerea análisis de métricas | Motor de Ingestion |
| `WorkoutAnalyzed` | Las métricas del Workout fueron calculadas | Actualiza TrainingLoad y Form del atleta | Motor de Analysis |
| `AthleteThresholdUpdated` | El FTP del atleta cambió | Invalida/recalcula zonas; puede requerir re-análisis de workouts recientes | Atleta o Coach |
| `CoachInsightGenerated` | AURORA generó una recomendación | Disponible para el atleta en la interfaz | Motor de Coaching |

### Políticas y reglas

| Política | Trigger | Respuesta | Prioridad |
|---|---|---|---|
| **No Análisis Sin Normalización** | Intento de analizar un Workout sin normalizar | Rechazar con error claro | Alta |
| **Zonas Basadas en Umbral** | Cambio de ThresholdPower | Recalcular TrainingZones del atleta | Alta |
| **Recálculo de Form** | WorkoutAnalyzed o AthleteThresholdUpdated | Recalcular Form y TrainingLoad del atleta | Alta |
| **Alerta de Fatiga Alta** | Form cae por debajo de -30 durante más de 5 días | Generar CoachInsight de alerta | Media |
| **Gaps En Stream Son Válidos** | Stream con valores nulos en posiciones | Procesar normalmente; no rechazar | Alta |

### Roles del dominio

| Rol | Descripción | Decisiones que toma |
|---|---|---|
| **Athlete** | Persona que entrena y genera datos | Entrena/descansa, comparte datos con coach, ajusta parámetros |
| **Coach** | Entrenador que diseña el plan y analiza progreso | Ajusta carga, recalibra umbrales, decide cuándo competir |
| **AURORA Engine** | No es un actor humano — es el sistema que calcula y razona | Calcula métricas, genera insights, detecta patrones |

---

## Fase 6 — Relationship Discovery

### Dependencias críticas

| Concepto | Necesita | Para |
|---|---|---|
| **TrainingZone** | **ThresholdPower** del atleta | Calcular los rangos de intensidad |
| **Form** | **TrainingLoad** (acute + chronic) | Calcular el balance fitness-fatiga |
| **TrainingLoad** | **Workouts analizados** con métricas | Acumular el estrés en ventanas de tiempo |
| **WorkoutMetrics** | **NormalizedWorkout** | Calcular potencia normalizada, TSS, etc. |
| **NormalizedWorkout** | **RawWorkout** (archivo FIT) | Convertir al formato estándar |
| **CoachInsight** | **Form**, **TrainingLoad**, **Athlete** context | Generar recomendaciones con contexto |

### Causalidades

| Si cambia | Se ve afectado | Urgencia |
|---|---|---|
| **ThresholdPower** del atleta | TrainingZones → TrainingLoad recalculado → Form recalculado | Alta — puede afectar todo el histórico |
| **WorkoutAnalyzed** (nuevo workout) | TrainingLoad (ATL y CTL) → Form → posiblemente CoachInsight | Inmediata |
| **Athlete crea una cuenta** | TrainingZones iniciales con FTP estimado por defecto | Baja — placeholder hasta test real |

### Agregados

| Agregado | Raíz | Contiene | Invariante central |
|---|---|---|---|
| **Athlete** | `Athlete` | ThresholdPower, TrainingZones, historial de Form | Las TrainingZones siempre derivan del ThresholdPower vigente |
| **Workout** | `Workout` | Streams, NormalizedWorkout, WorkoutMetrics | Las métricas sólo existen si hay NormalizedWorkout; no se modifican post-análisis |

### Invariantes del dominio

1. **Un Workout analizado es inmutable**: una vez calculadas las métricas, el Workout no se modifica. Si el atleta actualiza su FTP, se recalcula TrainingLoad y Form, pero las métricas del Workout original no cambian.
2. **Las TrainingZones siempre derivan del ThresholdPower vigente**: no pueden existir zonas "inventadas". Si el FTP cambia, las zonas se recalculan automáticamente.
3. **Streams con gaps son válidos**: valores nulos en un Stream son datos de primera clase, no errores. El sistema debe poder operar sobre streams incompletos.
4. **El Engine no conoce el formato FIT**: el Engine de análisis sólo recibe NormalizedWorkout. La transformación de FIT a NormalizedWorkout es responsabilidad exclusiva del contexto de Ingestion.

---

## Fase 7 — Domain Boundaries

### Bounded Contexts

| Contexto | Responsabilidad en una frase | Experto principal | Conceptos centrales |
|---|---|---|---|
| **Ingestion** | Convertir datos crudos de dispositivo en un NormalizedWorkout estándar | Ingeniero de datos, conocimiento de FIT protocol | RawWorkout, FITParser, NormalizedWorkout, Stream |
| **Performance** | Calcular métricas de una sesión (TSS, NP, IF, zonas de tiempo) | Fisiología del ejercicio, Banister model | WorkoutMetrics, TrainingZones, Power, HeartRate |
| **Longitudinal** | Acumular y analizar carga a lo largo del tiempo | Periodización, Banister CTL/ATL | TrainingLoad, Form, Fitness, Fatigue, TrainingCycle |
| **Prediction** | Proyectar forma futura y ventanas de pico de rendimiento | Modelos de periodización avanzada | AuroraIndex, PeakWindow, FormProjection |
| **Coaching** | Interpretar el estado del atleta y generar insights accionables | Conocimiento de entrenamiento, comunicación | CoachInsight, Alert, Recommendation |

### Context Map

```
[Ingestion] ──── WorkoutNormalized event ──── [Performance]
                                                    │
                                            WorkoutAnalyzed event
                                                    │
                                            [Longitudinal]
                                            (TrainingLoad, Form)
                                                    │
                                            ┌───────┴────────┐
                                            │                │
                                       [Prediction]     [Coaching]
                                     (AuroraIndex,     (CoachInsight,
                                      PeakWindow)       Alerts)
```

### Contratos entre contextos

| De | A | Qué cruza | Formato | Quién es responsable |
|---|---|---|---|---|
| Ingestion | Performance | `WorkoutNormalized` event + `NormalizedWorkout` | Evento de dominio con referencia | Ingestion publica; Performance consume |
| Performance | Longitudinal | `WorkoutAnalyzed` event + métricas calculadas | Evento de dominio con métricas | Performance publica; Longitudinal consume |
| Longitudinal | Prediction | `TrainingLoad`, `Form` históricos del atleta | Query (no evento) — Prediction lee Longitudinal | Longitudinal expone; Prediction lee |
| Longitudinal | Coaching | `Form`, `TrainingLoad`, `TrainingCycle` del atleta | Query — Coaching lee Longitudinal | Longitudinal expone; Coaching lee |
| Coaching | (UI/API) | `CoachInsight`, `Alert` | Read model / projection | Coaching publica al Read Model |

**Regla de oro**: ningún bounded context comparte su modelo interno. Los cruces son siempre vía eventos o contratos explícitos (DTOs, read models). El Engine de Performance no sabe que existe el FIT parser. El Coaching no sabe cómo se calcula el CTL.

---

## Fase 8 — Architecture Discovery

### Decisiones de arquitectura candidatas

| Candidato a ADR | Pregunta de decisión | Urgencia |
|---|---|---|
| **ADR-001** (ya existe) | ¿El FIT parser vive separado del Engine de análisis? | Alta — define la separación fundacional |
| **ADR-002** | ¿Cómo se comunican los bounded contexts? (eventos síncronos vs. colas) | Alta — impacta toda la infraestructura |
| **ADR-003** | ¿El cálculo de TrainingLoad y Form se hace on-demand o se mantiene pre-calculado? | Alta — trade-off de complejidad vs. performance |
| **ADR-004** | ¿CoachInsight usa LLM? ¿Con qué restricciones? | Media — define riesgo del producto |
| **ADR-005** | ¿Qué pasa cuando el ThresholdPower cambia? ¿Re-calculamos el histórico o mantenemos versiones? | Media — impacta corrección de datos históricos |

### Riesgos técnicos

| Riesgo | Impacto | Probabilidad | Mitigación propuesta |
|---|---|---|---|
| **Streams con alta frecuencia de muestreo** (1 dato/segundo = 7200 puntos/2hs) | Alto — volumen de datos puede ser sorprendente a escala | Media | Evaluar compresión y downsampling para análisis; mantener full-res para cálculo |
| **Recálculo en cascada por cambio de FTP** | Alto — un cambio de umbral puede invalida Form/TrainingLoad de meses | Media | Implementar version-aware TrainingLoad: nuevo FTP genera nueva línea, no sobreescribe |
| **Variabilidad entre dispositivos** (Garmin vs. Wahoo vs. Polar) | Alto — misma sesión puede tener formatos FIT distintos | Alta | Aislar esto en el Ingestion context; el Parser debe abstraer la variabilidad del dispositivo |
| **CoachInsight irrelevante o erróneo** | Alto para la confianza del atleta | Media | Insights deben incluir razonamiento explícito; atleta puede calificar la utilidad |
| **Atleta sin FTP válido** | Medio — todas las zonas y métricas dependen de esto | Alta (nuevo usuario) | Estimar FTP desde primeras sesiones; marcar insights como "estimados" hasta tener FTP real |

### Preguntas abiertas

- [ ] ¿Qué tan frecuentemente se actualiza el AuroraIndex? ¿En tiempo real o una vez al día?
- [ ] ¿Cómo maneja AURORA el atleta que no comparte todos sus datos de sueño/HRV? (datos de terceros)
- [ ] ¿Qué pasa si el atleta tiene dos FTPs: bici y running?
- [ ] ¿Los TrainingCycles son siempre definidos por el coach o AURORA puede inferirlos?

### Próximos pasos

1. Escribir ADR-002 sobre comunicación entre bounded contexts (eventos vs. queries)
2. Validar el modelo de TrainingLoad con un entrenador experto en periodización
3. Prototipo mínimo del contrato entre Ingestion y Performance para validar la separación
4. Definir qué datos mínimos necesita un atleta nuevo para que AURORA sea útil desde el día 1

---

## Historial

| Fecha | Actividad | Participantes |
|---|---|---|
| 2026-06-01 | Problem Discovery — entrevistas con atletas amateurs | Carlos del Río |
| 2026-06-05 | Decision Discovery — mapa de decisiones con entrenador de ciclismo | Carlos del Río, entrenador consultor |
| 2026-06-10 | Language Discovery + Concept Discovery — lenguaje ubicuo v1 | Carlos del Río |
| 2026-06-15 | Domain Boundaries — definición de bounded contexts v1 | Carlos del Río |
| 2026-06-26 | Integración con Domain Discovery methodology | Carlos del Río |

---

**Referencia**: [`playbook/15-domain-discovery.md`](../../../playbook/15-domain-discovery.md) · [`templates/domain-discovery-template.md`](../../../templates/domain-discovery-template.md) · [`docs/domain-model.md`](./domain-model.md)
