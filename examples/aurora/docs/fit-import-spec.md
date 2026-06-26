# Feature Spec — Import de archivos FIT

> Ejemplo de [feature spec](../../../templates/feature-spec-template.md) aplicada a un caso de uso concreto. Ilustra [`playbook/05-spec-driven-development.md`](../../../playbook/05-spec-driven-development.md).

| Campo | Valor |
|---|---|
| **Estado** | Aprobada (ejemplo) |
| **Autor** | C. del Río |
| **Fecha** | 2026-06-26 |
| **Producto** | AURORA |
| **ADRs relacionados** | ADR-0002 (normalización en el borde) |

## 1. Contexto y problema

Los atletas registran sus actividades en dispositivos que exportan el formato **FIT** (Flexible and Interoperable Data Transfer, estándar de Garmin). Es un formato binario, con variaciones entre fabricantes y campos opcionales. Para que el resto del sistema sea simple, toda esa complejidad debe resolverse **en el borde de ingreso**, dejando datos limpios y normalizados hacia adentro.

## 2. Objetivo

Permitir que un atleta suba un archivo FIT y que el sistema lo convierta en una `Activity` con streams normalizados, lista para que el Engine la analice.

## 3. No-objetivos

- No calcula métricas de rendimiento (eso es el [Engine](./aurora-engine-spec.md)).
- No soporta otros formatos en esta versión (TCX, GPX vienen después).
- No edita ni corrige manualmente los datos del atleta.

## 4. Usuarios y casos de uso

- **Atleta** que termina una actividad, exporta el FIT desde su dispositivo/app y lo sube a AURORA.

## 5. Comportamiento esperado

```
Dado un archivo FIT válido de una actividad de ciclismo
Cuando el atleta lo importa
Entonces se crea una Activity con sus streams normalizados y se emite ActivityImported

Dado un archivo FIT de un fabricante con campos faltantes (sin cadencia)
Cuando se importa
Entonces la Activity se crea igual, con los streams disponibles, sin inventar datos

Dado un archivo corrupto o que no es FIT
Cuando se intenta importar
Entonces el import falla con un error claro y accionable, sin crear una Activity a medias

Dado un archivo de una actividad ya importada (duplicado)
Cuando se intenta importar de nuevo
Entonces el sistema lo detecta y no crea un duplicado
```

## 6. Criterios de aceptación

- [ ] Un FIT válido produce una `Activity` con streams normalizados (unidades canónicas, eje temporal consistente).
- [ ] Campos opcionales ausentes (cadencia, potencia) no rompen el import: se omiten esos streams.
- [ ] Un archivo inválido/corrupto falla de forma atómica: **no** queda una `Activity` parcial.
- [ ] El import es **idempotente**: reimportar el mismo archivo no genera duplicados.
- [ ] Tras un import exitoso se emite `ActivityImported`.
- [ ] La normalización es agnóstica del fabricante: el Engine no debe poder distinguir el origen.

## 7. Modelo de dominio afectado

Crea `Activity` con sus `Stream`/`Sample`. Vive en el contexto **Ingestion**. Emite `ActivityImported`. Ver [`domain-model.md`](./domain-model.md).

## 8. Consideraciones

- **Arquitectura:** el parser de FIT es un detalle de infraestructura detrás de un puerto; el dominio recibe datos ya normalizados (ADR-0002). El dominio nunca conoce el formato FIT.
- **Seguridad:** un archivo subido es entrada no confiable. Validar tamaño, formato y contenido antes de procesar. No ejecutar nada del archivo. Ver [`playbook/12-security.md`](../../../playbook/12-security.md).
- **Observabilidad:** registrar imports exitosos, fallidos y duplicados; medir tiempo de procesamiento.
- **Performance:** archivos de actividades largas pueden ser grandes; procesar en streaming si hace falta.
- **Reversibilidad:** un import se puede deshacer (borrar la Activity creada) sin efectos colaterales.

## 9. Preguntas abiertas

- ¿Cómo detectamos duplicados exactamente: hash del archivo, o metadata (atleta + timestamp + duración)?
- ¿Qué hacemos con actividades que se solapan en el tiempo (doble registro de dispositivos)?
