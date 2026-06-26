# 14 — Roadmap del Playbook

> Este repo es un producto. Como todo producto, evoluciona.

## Estado actual

**v0.1 — Esqueleto foundacional.** La estructura, los principios y la doctrina base están en su lugar. Ahora el trabajo es llenarlo de profundidad y ejemplos reales.

## Cómo evoluciona

1. **Por uso.** Cuando un proyecto choca con un vacío del playbook, lo llenamos.
2. **Por ADR.** Las reglas no negociables se cambian con [ADRs](../templates/adr-template.md).
3. **Por ejemplo.** Cada patrón se gana su lugar mostrándose aplicado en [`examples/`](../examples).

## Próximos pasos

- [ ] Profundizar cada playbook con ejemplos de código concretos por stack.
- [ ] Completar el ejemplo de AURORA como referencia end-to-end.
- [ ] Sumar `examples/` para ProdeCaballito, Engage y Storysell.
- [ ] Definir el pipeline de CI concreto en [`09-build.md`](./09-build.md).
- [ ] Escribir runbooks de incidentes y observabilidad.
- [ ] Versionar y mejorar los prompts de [`claude/`](../claude) con el uso real.
- [ ] Agregar un glosario transversal del lenguaje ubicuo compartido.

## Versionado del playbook

Versionamos la doctrina de forma simple:

- **Mayor** — cambia una regla no negociable de la Constitution.
- **Menor** — se agrega o profundiza un playbook.
- **Patch** — correcciones, aclaraciones, ejemplos.

## Cómo contribuir

1. Proponé el cambio en una rama.
2. Si toca la Constitution, escribí un ADR.
3. Mantené el tono: directo, opinado, accionable. Nada de relleno.
4. Si una regla no evita un dolor concreto, no es una regla: es ruido. Sacala.

---

Anterior: [`13-ai-assisted-engineering.md`](./13-ai-assisted-engineering.md) · Volver al [README](../README.md)
