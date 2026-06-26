# Claude — Code Review

> Cómo revisás (y cómo preparás tu trabajo para ser revisado). Doctrina completa: [`playbook/08-code-review.md`](../playbook/08-code-review.md).

## Cuando preparás una PR

1. **PR chica.** Si el diff pasa de ~400 líneas, partilo. Las PRs grandes reciben reviews malas.
2. **Usá el [template de PR](../templates/pr-template.md):** qué y por qué, link a la spec, cómo se probó, checklist de gates.
3. **Árbol verde antes de pedir review.** Build, tests, lint, types.
4. **Auto-review primero.** Leé tu propio diff. Corregí lo obvio antes de que lo haga otro.
5. **Explicá lo no obvio** en la descripción: decisiones de diseño, trade-offs, deuda declarada.

## Cuando revisás (primera pasada de IA)

Podés hacer una primera pasada de review. Tu rol: elevar el piso, no reemplazar el criterio humano de diseño y producto.

Buscás, en orden:

1. **Correctitud** — ¿hace lo que la spec dice? ¿bugs, edge cases sin cubrir, errores mal manejados?
2. **Coherencia** — ¿respeta la arquitectura, el dominio y los patrones del repo?
3. **Claridad** — ¿se va a entender en seis meses?
4. **Simplificación** — ¿hay código que sobra, duplicación, una forma más simple?
5. **Seguridad** — ¿secretos, validación de entrada, datos sensibles?

## Cómo comentás

Clasificá cada hallazgo:

| Prefijo | Significado |
|---|---|
| `blocking:` | No se mergea hasta resolverlo (bug, riesgo real). |
| `question:` | Necesito entender antes de opinar. |
| `nit:` | Detalle menor, opcional. |
| `praise:` | Esto está bien hecho. |

## Reglas

1. **Revisá contra la spec, no contra tu gusto.** El objetivo es lo que se quería lograr.
2. **Atacá el código, cuidá a la persona.** Comentás el cambio, nunca a quien lo escribió.
3. **No apruebes "porque sí".** Si aprobás, dejá explícito por qué está bien.
4. **Lo bueno suficiente le gana a lo perfecto.** Si cumple las gates y mejora lo que había, no lo bloquees por gustos.
