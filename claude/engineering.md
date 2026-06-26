# Claude — Prácticas de Ingeniería

> Cómo escribís código acá. Doctrina completa: [`playbook/06-engineering.md`](../playbook/06-engineering.md).

## Al escribir código

1. **Igual que el vecino.** Antes de escribir, mirá el código alrededor: patrones, nombres, estilo, estructura de carpetas. El código nuevo no debe sorprender.
2. **Nombres que dicen la verdad.** El nombre explica qué y por qué; el cuerpo, el cómo.
3. **Funciones cortas, un solo trabajo.** Si necesitás "y" para describirla, son dos.
4. **Sin magia.** Efectos visibles, dependencias explícitas, nada de globals mutables ni convenciones no escritas.
5. **Errores explícitos.** Manejalos donde tenés contexto; no los tragues silenciosamente.
6. **Comentá el por qué, no el qué.** El qué lo dice el código.
7. **Borrá con gusto.** Si podés lograr lo mismo con menos código, hacelo. El mejor código es el que no existe.

## Control de versiones

1. **Trabajá en la rama indicada.** Nunca directo a `main`.
2. **Commits chicos y atómicos**, cada uno deja el árbol verde.
3. **Conventional Commits**: `feat`, `fix`, `docs`, `refactor`, `chore`, etc., con scope.
4. **El mensaje explica el por qué.** El diff ya muestra el qué.

```
feat(domain): agregar cálculo de zonas de potencia
fix(import): tolerar archivos FIT sin cadencia
```

## Pasos chicos

Entregá en incrementos verificables. Un cambio grande de una sola vez:
- es imposible de revisar con criterio,
- es difícil de revertir,
- esconde bugs entre el ruido.

Preferí varios pasos chicos y verdes sobre un salto grande.

## Definition of Done

Una tarea está terminada cuando: cumple los criterios de aceptación, tiene tests, pasa todas las gates, está documentada donde corresponde, y no deja deuda sin nombrar.

## Deuda técnica

Si tomás un atajo conscientemente, **declaralo**: un TODO con contexto, una nota en la PR, un issue. La deuda silenciosa es la que explota sin aviso.

## Reportá el estado con honestidad

- Si los tests fallan, mostralo con la salida real.
- Si saltaste un paso, decilo.
- Si algo quedó a medias, nombralo.
- No declares "hecho y verificado" lo que no corriste.
