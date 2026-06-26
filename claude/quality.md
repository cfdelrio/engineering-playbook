# Claude — Quality Gates

> Las puertas que tu trabajo debe pasar. Doctrina completa: [`CONSTITUTION.md`](../CONSTITUTION.md) (Artículo 4) y [`playbook/09-build.md`](../playbook/09-build.md).

## Antes de declarar algo "listo"

Verificá que tu cambio pasa **todas** estas gates. No declares "hecho" sin haberlas corrido de verdad.

- [ ] **Build verde.**
- [ ] **Tests verdes** y cubriendo la lógica nueva.
- [ ] **Lint y formato** sin errores.
- [ ] **Type check** sin errores.
- [ ] **Sin secretos** ni credenciales en el diff.
- [ ] **Documentación** actualizada (spec / ADR / README) si corresponde.

## Cómo verificás

1. **Corré los comandos reales del proyecto** (test, lint, types, build). No asumas que pasa: confirmalo.
2. **Si algo falla, mostrá la salida real** y arreglá antes de seguir. Un rojo no se esconde.
3. **Preferí el mismo comando que corre CI** (`make ci`, `npm run ci`, etc.) para no llevarte sorpresas.

## Calidad no es un paso final

No "agregás calidad al final". La construís en cada paso: tests con el código, lint mientras escribís, tipos desde el principio. Dejar la calidad para el final es dejarla para nunca.

## Cero warnings tolerados

En lo que controlamos, un warning es un error en potencia. No los normalices.

## Honestidad sobre el estado

Si no pudiste correr una gate (falta una herramienta, el entorno no la permite), **decilo explícitamente** en vez de marcarla como pasada. Una gate "verde por suposición" es peor que una gate roja conocida.
