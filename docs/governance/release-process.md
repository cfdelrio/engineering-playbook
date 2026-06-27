# Release Process

> Cómo preparamos, validamos y publicamos versiones del Engineering Playbook.

## Tipos de release

| Tipo | Cuándo | Proceso |
|---|---|---|
| **Patch** (`1.0.1`) | Fixes urgentes, links rotos, typos | Branch → PR → Merge → Tag |
| **Minor** (`1.1.0`) | Nuevo contenido, nuevos templates | Branch → PR → Review → Merge → Tag |
| **Major** (`2.0.0`) | Breaking changes en CONSTITUTION o decision-framework | ADL → Branch → PR → Review extendida → Merge → Tag |

---

## Branch strategy

| Branch | Propósito |
|---|---|
| `main` | Última versión estable. Siempre releaseable. |
| `release/vX.Y.Z` | Preparación de release específica. Merge a main cuando lista. |
| `feature/description` | Trabajo en nuevo contenido. |
| `fix/description` | Corrección de errores. |

### Reglas

- No hacer commits directamente a `main`.
- Todo cambio entra por PR.
- `main` siempre pasa el release checklist.

---

## Proceso de release paso a paso

### 1. Crear branch de release

```bash
git checkout main
git pull origin main
git checkout -b release/v1.1.0
```

### 2. Preparar el contenido

- Completar los cambios planeados
- Actualizar CHANGELOG.md con las entradas de la versión
- Actualizar cualquier "versión" mencionada en README o CONSTITUTION
- Verificar todos los links internos

### 3. Release checklist

Completar [`docs/governance/release-checklist.md`](./release-checklist.md) antes de continuar.

### 4. Crear Pull Request

Título del PR: `Release: Engineering Playbook vX.Y.Z`

Body del PR debe incluir:
- Resumen de cambios
- CHANGELOG diff
- Confirmación de release checklist completado

### 5. Review

| Release | Revisores requeridos |
|---|---|
| Patch | 1 (puede ser el maintainer solo) |
| Minor | 1 reviewer externo |
| Major | 2+ reviewers, discusión en issue previo |

### 6. Merge a main

Usar **squash merge** para releases Patch y Minor.
Usar **merge commit** para releases Major (para preservar la historia del branch).

### 7. Tag

Inmediatamente después de merge:

```bash
git checkout main
git pull origin main
git tag -a vX.Y.Z -m "Engineering Playbook vX.Y.Z — [descripción corta]"
git push origin vX.Y.Z
```

### 8. Release notes en GitHub

Crear GitHub Release desde el tag:
- Título: `Engineering Playbook vX.Y.Z`
- Body: contenido de la entrada en CHANGELOG
- Pre-release: marcar si es `-alpha`, `-beta`, o `-rc`

---

## Deprecaciones

Cuando algo se depreca (sin eliminarlo):

1. Agregar nota al documento: `> **Deprecated**: Este documento será removido en v2.0. Ver [nuevo doc].`
2. Agregar entrada en CHANGELOG bajo `### Deprecated`
3. Mantener el documento hasta el próximo MAJOR release
4. En el MAJOR release, mover a `archive/` o eliminar, con entrada en CHANGELOG bajo `### Removed`

---

## Compatibilidad entre versiones del playbook

Proyectos que adoptan el playbook deben documentar qué versión están siguiendo.

**Recomendación**: Agregar al README del proyecto:

```markdown
## Engineering Playbook

Este proyecto sigue [Engineering Playbook v1.0.0](https://github.com/cfdelrio/engineering-playbook/releases/tag/v1.0.0).
```

Al hacer upgrade a una nueva MAJOR:
1. Leer el CHANGELOG completo de la nueva versión
2. Evaluar impacto en el proyecto
3. Crear ADR en el proyecto documentando la migración
4. Actualizar la referencia en el README

---

## Versiones soportadas

Ver [`SECURITY.md`](../../SECURITY.md#supported-versions) para la política de soporte.

---

Siguiente: [`versioning.md`](./versioning.md) · [Índice](./README.md)
