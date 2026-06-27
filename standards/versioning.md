# Versioning Standard

> Qué versión usar, cuándo bumpearlo, y cómo tagear en git.

## Regla general

**Semantic Versioning 2.0.0** para todos los proyectos.

```
v1.2.3
│ │ └─ PATCH  — bug fix, typo, cambio de config sin efecto observable
│ └─── MINOR  — feature nueva, backward compatible
└───── MAJOR  — breaking change (rompe clientes existentes)
```

Siempre con prefijo `v` en el tag de git: `v1.0.0`.

---

## Qué es un breaking change

Un breaking change es cualquier modificación que **rompe un cliente existente sin que el cliente cambie su código**.

### Breaking changes (requieren MAJOR)

**APIs**:
- Eliminar o renombrar un endpoint
- Cambiar el formato de respuesta de un campo existente
- Cambiar el tipo de dato de un campo (`string` → `number`)
- Agregar un campo obligatorio a un request
- Cambiar autenticación requerida

**Dominio**:
- Renombrar conceptos del lenguaje ubicuo (cambia el contrato del dominio)
- Cambiar el comportamiento observable de una operación de dominio

**Interfaces**:
- Renombrar una función pública o método de interfaz
- Cambiar la firma de una función (parámetros, tipos de retorno)
- Eliminar un tipo o interfaz exportada

### No son breaking changes (Minor o Patch)

**Minor**:
- Agregar un endpoint nuevo
- Agregar un campo opcional a una respuesta existente
- Agregar una función pública nueva sin modificar las existentes
- Agregar un nuevo tipo exportado

**Patch**:
- Bug fixes que no cambian el contrato
- Mejoras de performance internas
- Refactoring sin cambio de comportamiento
- Actualizar dependencias (sin cambios de API)
- Correcciones de documentación

---

## Pre-release

Para trabajo en progreso que se quiere compartir:

```
v1.1.0-alpha.1  ← Trabajo activo, puede romper entre versiones
v1.1.0-beta.1   ← Feature completa, testing
v1.1.0-rc.1     ← Release candidate, sólo fixes críticos
v1.1.0          ← Release oficial
```

**Regla**: Pre-releases nunca se usan en producción salvo pruebas explícitas.

---

## CalVer (excepcional)

CalVer (`YYYY.MM.PATCH`) aplica sólo a proyectos con cadencia de release calendarizada.

**Ejemplo**: Un newsletter técnico, un reporte mensual, actualizaciones de datos.

**Documentar en ADR**: Si un proyecto elige CalVer sobre SemVer, debe explicarlo en `ADR-NNN-versioning-strategy.md`.

La mayoría de los proyectos usan SemVer.

---

## Tags en git

```bash
# Tag release
git tag -a v1.0.0 -m "Descripción del release"
git push origin v1.0.0

# Tag pre-release
git tag -a v1.1.0-beta.1 -m "Beta: nueva feature X"
git push origin v1.1.0-beta.1

# Nunca borrar tags — crear versión nueva si hay error
```

---

## Versionado de documentos

Los documentos del playbook no siguen SemVer individualmente.
La versión del playbook es del **repositorio entero**.

Para documentos que tienen cambios sustanciales:
- Agregar historial al footer del documento
- Si el cambio es breaking: crear nueva versión numerada del doc y archivar la anterior

Ver [`document-lifecycle.md`](../lifecycle/document-lifecycle.md#versionado).

---

## Checklista antes de release

- [ ] CHANGELOG actualizado con entrada para la versión
- [ ] Versión en tag coincide con entrada de CHANGELOG
- [ ] Tag tiene prefijo `v`
- [ ] Release notes preparadas
- [ ] Proyectos dependientes notificados (si hay breaking changes)

---

Anterior: [`naming.md`](./naming.md) · [Índice de Standards](../)
