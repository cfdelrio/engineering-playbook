# Engineering Playbook

> La fuente de verdad de ingeniería para todos mis productos: **AURORA**, **ProdeCaballito**, **Engage**, **Storysell** y los que vengan.

Este repositorio **no contiene código de aplicación**. Contiene la doctrina: principios, playbooks, plantillas y reglas para construir software de forma consistente, con calidad alta y asistido por IA (Claude Code).

La meta es simple: que cualquier proyecto nuevo arranque ya sabiendo *cómo se hace acá*, y que cualquier persona (o agente) que entre a colaborar herede el mismo criterio sin tener que adivinarlo.

## Cómo está organizado

| Carpeta | Qué contiene |
|---|---|
| [`CONSTITUTION.md`](./CONSTITUTION.md) | Las reglas no negociables. El contrato de ingeniería. |
| [`playbook/`](./playbook) | El cuerpo doctrinal: del manifiesto al roadmap, en orden de lectura. |
| [`templates/`](./templates) | Plantillas listas para copiar: ADRs, feature specs, PRs, system prompts. |
| [`claude/`](./claude) | Reglas y contexto para trabajar con Claude Code / IA en estos proyectos. |
| [`examples/`](./examples) | Aplicación real de la doctrina. Empezando por AURORA. |

## Por dónde empezar

1. Leé [`playbook/00-manifesto.md`](./playbook/00-manifesto.md) — el por qué.
2. Leé [`CONSTITUTION.md`](./CONSTITUTION.md) — lo no negociable.
3. Recorré el `playbook/` en orden numérico.
4. Cuando arranques un proyecto, seguí la guía de abajo.

## Cómo usar este playbook en un proyecto nuevo

**Para cada proyecto nuevo** (AURORA, ProdeCaballito, Engage, Storysell u otros):

1. **Copia los templates** que necesites:
   - Crea un [`CLAUDE.md`](./templates/system-prompt-template.md) con el contexto específico de tu proyecto, importando desde [`claude/`](./claude).
   - Crea la estructura de [`docs/`](./templates/project-readme-template.md): `docs/adr/`, `docs/specs/`, `docs/`.
   - Copia el [`README.md`](./templates/project-readme-template.md) del proyecto y adaptalo.

2. **Registra tus decisiones**:
   - Toda decisión de arquitectura → [`adr-template.md`](./templates/adr-template.md) en `docs/adr/`.
   - Toda feature no trivial → [`feature-spec-template.md`](./templates/feature-spec-template.md) en `docs/specs/`.

3. **Configura tu CI/CD**:
   - Las [quality gates](./CONSTITUTION.md#artículo-4--quality-gates) son no negociables.
   - Ver [`playbook/09-build.md`](./playbook/09-build.md) para detalles de setup.

4. **Trabajo asistido por IA**:
   - Referencia [`claude/`](./claude) desde tu `CLAUDE.md`.
   - Mantén ese contexto sincronizado conforme evolucionas.

**Ejemplo completo**: ver [`examples/aurora/`](./examples/aurora) — es una aplicación real de toda esta doctrina.

## Principios rectores (resumen)

- **Architecture First** — decidimos la forma antes de escribir el código.
- **Domain Driven Design** — el lenguaje del negocio manda en el código.
- **Spec Driven Development** — primero la spec, después la implementación.
- **AI Assisted Engineering** — la IA es un par, no un atajo para saltarse el criterio.
- **Quality Gates** — nada llega a `main` sin pasar las puertas de calidad.

## Estado

Este repo es **vivo**. Si una regla deja de servir, se cambia con un ADR. La doctrina evoluciona; la disciplina de documentarla, no.
