# 06 — Prácticas de Ingeniería

> Cómo escribimos código el día a día.

## Código

1. **Nombres que dicen la verdad.** Un nombre debe explicar el qué y el por qué; el cómo lo dice el cuerpo.
2. **Funciones cortas con un solo trabajo.** Si necesitás "y" para describir lo que hace, son dos funciones.
3. **Sin magia.** Nada de efectos ocultos, globals mutables o convenciones no escritas.
4. **Errores explícitos.** Manejá los errores donde tenés el contexto para decidir; no los tragues.
5. **Comentá el por qué, no el qué.** El código dice qué hace. Los comentarios explican por qué se hizo así (y por qué no de otra forma).
6. **Igual que el vecino.** Código nuevo que respeta los patrones, nombres y estilo del código que lo rodea.

## Control de versiones

1. **Commits chicos y atómicos.** Un commit = un cambio coherente que deja el árbol verde.
2. **Mensajes de commit que explican el por qué.** El diff dice qué cambió; el mensaje dice por qué.
3. **Trabajamos en ramas.** Nunca directo a `main`. Una rama por feature/fix.
4. **Rebase para limpiar, merge para integrar.** Historia legible sobre historia literal.
5. **Nunca reescribas historia compartida** sin avisar.

### Convención de commits

Usamos [Conventional Commits](https://www.conventionalcommits.org/):

```
feat(domain): agregar cálculo de zonas de potencia
fix(import): tolerar archivos FIT sin campo de cadencia
docs(playbook): aclarar regla de quality gates
refactor(engine): extraer normalización de series temporales
```

## Ramas

```
main           ← siempre desplegable, siempre verde
  feature/...  ← trabajo en curso
  fix/...      ← correcciones
```

## Definition of Done

Una tarea está **terminada** cuando:

- [ ] Cumple los criterios de aceptación de su spec.
- [ ] Tiene tests que cubren la lógica nueva.
- [ ] Pasa todas las [quality gates](../CONSTITUTION.md#artículo-4--quality-gates).
- [ ] Está documentada donde corresponde (spec, ADR, README).
- [ ] Fue revisada y aprobada.
- [ ] No deja TODOs sin ticket ni deuda sin nombrar.

## Deuda técnica

La deuda no es pecado; la deuda *no declarada* sí. Si tomás un atajo, dejalo escrito (TODO con contexto, issue, o nota en la PR). Deuda silenciosa es deuda que nadie va a pagar hasta que explote.

---

Anterior: [`05-spec-driven-development.md`](./05-spec-driven-development.md) · Siguiente: [`07-testing.md`](./07-testing.md)
