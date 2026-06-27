# Release Checklist

> Completar antes de cada release del Engineering Playbook.

Copiar y completar en el PR de release.

---

## Documentación

- [ ] Todos los documentos nuevos tienen la tabla de metadata (Status, Type, Created, Author, Applies To)
- [ ] Todos los documentos tienen navegación al pie (Anterior / Siguiente / Índice)
- [ ] No hay placeholders sin completar (`[Link]`, `TODO`, `TBD`, `...`)
- [ ] Los documentos deprecados están marcados con nota de deprecación
- [ ] El lenguaje es consistente (sin mezclar inglés/español en conceptos clave)

## Templates

- [ ] Todos los templates tienen ejemplos claros de uso
- [ ] Los templates tienen `[PLACEHOLDER]` marcados explícitamente para que sean visibles
- [ ] Los templates no asumen un stack técnico específico (a menos que sea intencional)
- [ ] El template de ADR y el de Feature Spec están alineados con `lifecycle/decision-framework.md`

## Links internos

- [ ] Todos los links relativos apuntan a archivos que existen
- [ ] Los links de navegación (Anterior/Siguiente) forman cadenas correctas sin saltos
- [ ] Los links en README apuntan a archivos existentes

## Naming

- [ ] Carpetas en `snake_case`
- [ ] Archivos de documentación en `kebab-case.md`
- [ ] Templates alineados con convenciones de `standards/naming.md`
- [ ] Ningún archivo con nombre genérico (`temp.md`, `draft.md`, `notes.md`)

## Markdown

- [ ] Todos los archivos tienen un `# Título` en la primera línea
- [ ] Las tablas tienen columnas alineadas
- [ ] Los bloques de código tienen lenguaje especificado (` ```typescript `, ` ```bash `)
- [ ] No hay líneas en blanco excesivas (máximo 2 consecutivas)
- [ ] Headings siguen jerarquía correcta (H1 → H2 → H3, sin saltar niveles)

## Ejemplos

- [ ] El ejemplo de AURORA es representativo de la doctrina actual
- [ ] Cualquier ejemplo de código en el playbook compila o es claramente pseudocódigo
- [ ] Los ejemplos no referencian tecnologías específicas que puedan quedar desactualizadas rápido

## Governance

- [ ] CHANGELOG.md tiene entrada para esta versión
- [ ] La versión en CHANGELOG coincide con el tag a crear
- [ ] La sección `[Unreleased]` está vacía (o con ítems planeados para próxima versión)
- [ ] CONSTITUTION.md no fue modificado (si fue modificado: ¿hubo ADL aprobado?)
- [ ] `lifecycle/decision-framework.md` no fue modificado sin aprobación

## Licencia y metadatos del proyecto

- [ ] LICENSE existe y es correcto
- [ ] CODEOWNERS refleja la realidad actual del equipo
- [ ] SECURITY.md tiene información de contacto actualizada
- [ ] CONTRIBUTING.md está actualizado con el proceso actual

## Version y release

- [ ] La versión sigue SemVer correctamente (MAJOR.MINOR.PATCH)
- [ ] El tipo de cambio justifica el tipo de versión:
  - Patch: sólo fixes, clarificaciones, links
  - Minor: nuevo contenido, nuevos templates
  - Major: cambios en CONSTITUTION o decision-framework
- [ ] El tag será `vX.Y.Z` (con prefijo `v`)
- [ ] Las release notes están preparadas para GitHub Release

## Review

- [ ] Al menos 1 revisor aprobó el PR (Minor/Major: 2 revisores)
- [ ] No hay comentarios de review pendientes sin resolver
- [ ] El branch está actualizado con `main` (sin conflictos)

---

## Checklist de release post-merge

- [ ] Tag creado: `git tag -a vX.Y.Z -m "message"`
- [ ] Tag pusheado: `git push origin vX.Y.Z`
- [ ] GitHub Release creada desde el tag
- [ ] Release marcada como "Latest release" (si es versión stable)
- [ ] Proyectos dependientes notificados (si hay breaking changes)

---

## Firma de release

| Campo | Valor |
|---|---|
| **Versión** | vX.Y.Z |
| **Fecha** | YYYY-MM-DD |
| **Maintainer** | @cfdelrio |
| **Checklist completado por** | |
| **PR** | #NNN |

---

[Volver al Índice](./README.md)
