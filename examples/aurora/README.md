# AURORA — Ejemplo de referencia

> Este directorio muestra el [engineering-playbook](../../README.md) **aplicado** a un producto real: AURORA. Es una referencia, no la documentación viva del proyecto (esa vive en el repo de AURORA).

AURORA es una plataforma de **entrenamiento y análisis de rendimiento deportivo**: importa datos de actividades (archivos FIT de dispositivos como Garmin/Wahoo), los normaliza y los procesa a través de un motor de análisis para entregarle al atleta métricas accionables sobre su rendimiento.

## Qué demuestra este ejemplo

| Documento | Qué ilustra del playbook |
|---|---|
| [`MANIFESTO.md`](./MANIFESTO.md) | Manifiesto de producto ([playbook/00](../../playbook/00-manifesto.md), [01](../../playbook/01-product.md)) |
| [`docs/product-vision.md`](./docs/product-vision.md) | Visión de producto ([playbook/01](../../playbook/01-product.md)) |
| [`docs/domain-model.md`](./docs/domain-model.md) | Domain Driven Design aplicado ([playbook/04](../../playbook/04-domain-driven-design.md)) |
| [`docs/aurora-engine-spec.md`](./docs/aurora-engine-spec.md) | Feature spec de un subsistema central ([playbook/05](../../playbook/05-spec-driven-development.md)) |
| [`docs/fit-import-spec.md`](./docs/fit-import-spec.md) | Feature spec de un caso de uso concreto ([playbook/05](../../playbook/05-spec-driven-development.md)) |

## Cómo leerlo

1. Empezá por el [`MANIFESTO.md`](./MANIFESTO.md) — el por qué.
2. Seguí con [`docs/product-vision.md`](./docs/product-vision.md) — el qué y para quién.
3. Entendé el dominio en [`docs/domain-model.md`](./docs/domain-model.md) — el lenguaje.
4. Mirá cómo una idea se vuelve spec en [`docs/aurora-engine-spec.md`](./docs/aurora-engine-spec.md) y [`docs/fit-import-spec.md`](./docs/fit-import-spec.md).

> Nota: el contenido de AURORA acá es ilustrativo y simplificado, pensado para mostrar la *forma* de aplicar el playbook. Los números y reglas exactas se definen en el repo del producto.
