# Engineering Playbook

> La fuente de verdad de ingeniería para todos mis productos: **AURORA**, **ProdeCaballito**, **Engage**, **Storysell** y los que vengan.

Este repositorio **no contiene código de aplicación**. Contiene la doctrina: principios, playbooks, plantillas y reglas para construir software de forma consistente, con calidad alta y asistido por IA.

La meta es simple: que cualquier proyecto nuevo arranque ya sabiendo *cómo se hace acá*, y que cualquier persona (o agente) que entre a colaborar herede el mismo criterio sin tener que adivinarlo.

---

## Cómo está organizado

| Carpeta/Archivo | Qué contiene |
|---|---|
| [`CONSTITUTION.md`](./CONSTITUTION.md) | Las reglas no negociables. El contrato de ingeniería. |
| [`playbook/`](./playbook) | El cuerpo doctrinal: del manifiesto al roadmap, en orden de lectura. |
| [`lifecycle/`](./lifecycle) | Cómo se toman y documentan decisiones (ADL, EDL, decision-framework). |
| [`standards/`](./standards) | Estándares de naming, estructura, metadata y versionado. |
| [`templates/`](./templates) | Plantillas listas para copiar: ADRs, feature specs, PRs, system prompts. |
| [`claude/`](./claude) | Contexto para trabajar con Claude Code en estos proyectos. |
| [`examples/`](./examples) | Aplicación real de la doctrina. Empezando por AURORA. |
| [`docs/governance/`](./docs/governance) | Cómo se versiona, libera y mantiene este playbook. |

---

## Por dónde empezar

1. Leé [`playbook/00-manifesto.md`](./playbook/00-manifesto.md) — el por qué.
2. Leé [`CONSTITUTION.md`](./CONSTITUTION.md) — lo no negociable.
3. Recorré el `playbook/` en orden numérico.
4. Cuando arranques un proyecto, seguí la guía de abajo.

---

## Cómo usar este playbook en un proyecto nuevo

**Para cada proyecto nuevo** (AURORA, ProdeCaballito, Engage, Storysell u otros):

1. **Copia los templates** que necesites:
   - Crea un `CLAUDE.md` desde [`templates/system-prompt-template.md`](./templates/system-prompt-template.md).
   - Crea la estructura de `docs/` según [`standards/repository-topology.md`](./standards/repository-topology.md).
   - Copia el [`templates/project-readme-template.md`](./templates/project-readme-template.md) y adaptalo.

2. **Define tu nivel de madurez**:
   - Elegí un EML (0-5) según la criticidad del proyecto.
   - Documentalo en `ADR-001-engineering-maturity-level.md`.
   - Ver [`docs/governance/engineering-maturity-levels.md`](./docs/governance/engineering-maturity-levels.md).

3. **Registra tus decisiones**:
   - Toda decisión de arquitectura → [`templates/adr-template.md`](./templates/adr-template.md) en `docs/architecture/adr/`.
   - Toda feature no trivial → [`templates/feature-spec-template.md`](./templates/feature-spec-template.md) en `docs/specs/`.

4. **Configura tu CI/CD**:
   - Las [quality gates](./CONSTITUTION.md) son no negociables.
   - Ver [`playbook/09-build.md`](./playbook/09-build.md) para detalles de setup.

5. **Trabajo asistido por IA**:
   - Referencia [`claude/`](./claude) desde tu `CLAUDE.md`.
   - Mantén ese contexto sincronizado conforme evolucionas.

**Ejemplo completo**: ver [`examples/aurora/`](./examples/aurora) — es una aplicación real de toda esta doctrina.

---

## Usando este playbook en proyectos existentes

Si el proyecto ya existe y adoptás el playbook después:

1. **No te ahogues con el proceso.** Adoptá gradualmente por EML.
2. **Documentá lo que ya decidiste.** Escribí ADRs retroactivos para decisiones pasadas.
3. **Empezá por la doctrina, no por el proceso.** Leé el playbook antes de implementar estructura.
4. **Elegí un EML honesto.** Si el proyecto está en EML-1, no impongas EML-4.

---

## Governance

Este playbook se versiona con SemVer. La versión actual es **v1.0.0**.

| Documento | Descripción |
|---|---|
| [`CHANGELOG.md`](./CHANGELOG.md) | Historial de cambios por versión |
| [`CONTRIBUTING.md`](./CONTRIBUTING.md) | Cómo contribuir al playbook |
| [`docs/governance/release-process.md`](./docs/governance/release-process.md) | Proceso de release |
| [`docs/governance/versioning.md`](./docs/governance/versioning.md) | Política de versionado |
| [`docs/governance/engineering-maturity-levels.md`](./docs/governance/engineering-maturity-levels.md) | Marco EML |

### Release Policy

- **MAJOR** (`2.0.0`): Cambios en CONSTITUTION o decision-framework. Requiere ADL y revisión extendida.
- **MINOR** (`1.1.0`): Nuevo contenido, nuevos templates. Backward compatible.
- **PATCH** (`1.0.1`): Typos, links, clarificaciones.

### Supported Versions

| Versión | Soporte |
|---|---|
| `1.x.x` (actual) | Activo — recibe fixes y nuevas secciones |
| `< 1.0.0` | Sin soporte |

---

## Version Compatibility

Proyectos que adoptan este playbook deben documentar qué versión siguen:

```markdown
## Engineering Playbook
Seguimos [Engineering Playbook v1.0.0](https://github.com/cfdelrio/engineering-playbook/releases/tag/v1.0.0).
```

Upgrading a MAJOR version requiere ADR en el proyecto documentando la migración.

---

## AI Agent Compatibility

La carpeta [`claude/`](./claude) contiene contexto optimizado para **Claude Code**. El sistema de prompts es modular: cada archivo cubre un dominio (arquitectura, testing, deploy, seguridad), y el `system.md` es el punto de entrada.

Para usar con otros agentes (Cursor, Copilot, etc.):
- Los principios son agnósticos al proveedor.
- El contexto en `claude/` puede adaptarse al formato del agente que uses.
- Ver [ADR-001](./docs/decisions/ADR-001-claude-folder-vs-agents-folder.md) sobre la decisión de naming de esta carpeta.

---

## Principios rectores (resumen)

- **Architecture First** — decidimos la forma antes de escribir el código.
- **Domain Driven Design** — el lenguaje del negocio manda en el código.
- **Spec Driven Development** — primero la spec, después la implementación.
- **AI Assisted Engineering** — la IA es un par, no un atajo para saltarse el criterio.
- **Quality Gates** — nada llega a `main` sin pasar las puertas de calidad.

---

## Estado

Este repo es **vivo**. Si una regla deja de servir, se cambia con un ADR. La doctrina evoluciona; la disciplina de documentarla, no.

**Versión**: v1.0.0 · **Licencia**: [CC BY-SA 4.0](./LICENSE) · **Maintainer**: [@cfdelrio](https://github.com/cfdelrio)
