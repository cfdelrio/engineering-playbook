# <Proyecto>

> <Una línea: qué es y para quién.>

## Qué es esto

<Párrafo corto: el problema que resuelve y el usuario al que sirve. Link al `MANIFESTO.md` para la visión completa.>

## Estado

<Alpha · Beta · Producción> — <una línea de contexto>

## Arquitectura

Este proyecto sigue el [engineering-playbook](https://github.com/cfdelrio/engineering-playbook): Architecture First, Domain Driven, Spec Driven.

- **Visión de producto:** [`docs/product-vision.md`](./docs/product-vision.md)
- **Modelo de dominio:** [`docs/domain-model.md`](./docs/domain-model.md)
- **Decisiones de arquitectura:** [`docs/adr/`](./docs/adr/)
- **Specs de features:** [`docs/specs/`](./docs/specs/)

## Stack

| Capa | Tecnología |
|---|---|
| ... | ... |

## Empezar a desarrollar

### Requisitos

- ...

### Setup

```bash
# clonar, instalar, configurar entorno
```

### Comandos

```bash
<cmd> install      # instalar dependencias
<cmd> dev          # correr en local
<cmd> test         # tests
<cmd> lint         # lint + format + types
<cmd> build        # build de producción
```

## Cómo contribuir

1. Toda feature no trivial arranca con una [feature spec](./docs/specs/).
2. Trabajá en una rama. PRs chicas.
3. Pasá todas las [quality gates](https://github.com/cfdelrio/engineering-playbook/blob/main/CONSTITUTION.md) antes de pedir review.

## Configuración

Los secretos van por variables de entorno. Nunca en el repo. Ver `.env.example`.

## Licencia

<licencia>
