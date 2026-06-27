# Versioning Standard

> Cómo versionamos el Engineering Playbook y cómo los proyectos que lo usan deben versionar sus propios artefactos.

## Versionado del Engineering Playbook

El Engineering Playbook usa **Semantic Versioning 2.0.0** (`MAJOR.MINOR.PATCH`).

### Qué requiere cada versión

| Tipo | Cuándo | Ejemplos |
|---|---|---|
| **MAJOR** (`2.0.0`) | Rompe compatibilidad con principios existentes. No se puede migrar sin leer el CHANGELOG. | Cambio en CONSTITUTION, restructura del decision-framework, eliminación de artículos |
| **MINOR** (`1.1.0`) | Agrega contenido nuevo sin romper lo existente. | Nuevos documentos en playbook, nuevos templates, nueva sección de standards |
| **PATCH** (`1.0.1`) | Fixes sin cambio de significado. | Typos, links rotos, aclaraciones que no cambian la decisión |

### Qué NO rompe compatibilidad (no requiere MAJOR)

- Agregar nuevas secciones a documentos existentes
- Agregar nuevos templates o ejemplos
- Mejorar redacción sin cambiar el significado
- Agregar documentos nuevos a `docs/governance/`
- Actualizaciones de CHANGELOG o README de navegación

### Qué SÍ rompe compatibilidad (requiere MAJOR)

- Modificar o eliminar artículos de `CONSTITUTION.md`
- Cambiar el decision-framework de 5 niveles
- Renombrar carpetas principales (`playbook/`, `templates/`, `claude/`)
- Eliminar templates que proyectos dependen de
- Cambiar el formato de metadata de documentos oficiales

### Proceso de release

Ver [`docs/governance/release-process.md`](./release-process.md).

---

## Versionado de proyectos que usan este playbook

Cada proyecto (AURORA, Engage, etc.) sigue estas reglas:

### Regla general

**Semantic Versioning** para todos los proyectos:

```
v1.2.3
│ │ └─ PATCH: bug fix, typo, config change
│ └─── MINOR: nueva feature, backward compatible
└───── MAJOR: breaking change
```

### Qué es un breaking change en código

Cambia el comportamiento observable desde fuera del sistema:

- Eliminar o renombrar un endpoint de API pública
- Cambiar el formato de respuesta de la API
- Cambiar autenticación requerida
- Eliminar o renombrar un campo que los clientes usan
- Cambiar el orden de operaciones que produce resultados diferentes

### Qué NO es un breaking change

- Agregar un nuevo campo opcional a una respuesta
- Agregar un nuevo endpoint
- Mejorar performance sin cambiar comportamiento
- Refactoring interno sin cambio de comportamiento
- Cambios en documentación

### Pre-release versioning

Para feedback antes de release oficial:

```
v1.1.0-alpha.1  ← Trabajo en progreso, puede romper
v1.1.0-beta.1   ← Feature completa, testing en progreso
v1.1.0-rc.1     ← Release Candidate, solo fixes críticos
v1.1.0          ← Release oficial
```

### CalVer (para proyectos calendario-driven)

Proyectos como AURORA que tienen releases atados a períodos de tiempo pueden usar:

```
YYYY.MM.PATCH
2026.07.0  ← primera release de julio 2026
2026.07.1  ← fix dentro del mismo período
2026.08.0  ← release de agosto 2026
```

**Usar CalVer sólo si**: el producto tiene cadencia de release calendarizada y los usuarios esperan actualizaciones periódicas.

**Documentar en ADR**: La decisión de usar CalVer vs SemVer debe estar en un ADR del proyecto.

---

## Tags de git

### Formato de tag

```
v1.0.0
```

Siempre con prefijo `v`.

### Proceso de tagging

```bash
# Crear tag local
git tag -a v1.0.0 -m "Engineering Playbook v1.0.0"

# Push tag al remote
git push origin v1.0.0
```

**No borrar tags.** Si un release tiene error, tagear una nueva versión.

### Tags de pre-release

```bash
git tag -a v1.1.0-beta.1 -m "Beta: Engineering Maturity Levels"
git push origin v1.1.0-beta.1
```

---

## Backporting

Para fixes críticos en versiones anteriores:

1. Verificar si el fix aplica a la versión anterior
2. Hacer cherry-pick del commit al branch de la versión anterior
3. Crear tag de patch: `v1.0.1`
4. Documentar en CHANGELOG bajo la versión correspondiente

**Política de soporte**: La versión MAJOR anterior recibe backports de seguridad durante 6 meses después del release de la nueva MAJOR.

---

## CHANGELOG

Todo release lleva entrada en [`CHANGELOG.md`](../../CHANGELOG.md).

Formato Keep a Changelog:

```markdown
## [1.1.0] — 2026-09-01

### Added
- EML: Engineering Maturity Levels framework

### Changed
- README: Added Governance section

### Fixed
- Broken link in standards/naming.md
```

**Regla**: Nunca publicar release sin CHANGELOG actualizado.

---

Anterior: [`release-process.md`](./release-process.md) · Siguiente: [`engineering-maturity-levels.md`](./engineering-maturity-levels.md)
