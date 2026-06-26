# Pull Request Template

> Copiá esto a `.github/pull_request_template.md` en el proyecto. Mantené la PR chica (~400 líneas de diff máximo). Ver [`playbook/08-code-review.md`](../playbook/08-code-review.md).

---

## Qué y por qué

Una o dos frases: qué cambia esta PR y por qué. El "por qué" importa más que el "qué" — el diff ya muestra el qué.

## Spec / Issue relacionada

<link a la feature spec, ADR o issue>

## Cómo se probó

- [ ] Tests automatizados (unitarios / integración / E2E).
- [ ] Probado manualmente: <describí qué y cómo>.

## Tipo de cambio

- [ ] `feat` — nueva funcionalidad
- [ ] `fix` — corrección de bug
- [ ] `refactor` — sin cambio de comportamiento
- [ ] `docs` — documentación
- [ ] `chore` — mantenimiento / infra

## Checklist de Quality Gates

> Ver [Constitution, Artículo 4](../CONSTITUTION.md#artículo-4--quality-gates).

- [ ] Build verde.
- [ ] Tests verdes y cubren la lógica nueva.
- [ ] Lint y formato sin errores.
- [ ] Type check sin errores.
- [ ] Sin secretos ni credenciales en el diff.
- [ ] Documentación actualizada (spec / ADR / README) si corresponde.
- [ ] Auto-review hecho: leí mi propio diff.

## Notas para el revisor

Lo no obvio: decisiones de diseño, trade-offs tomados, áreas donde querés foco especial, o deuda declarada conscientemente.

## Riesgo y rollback

- **Riesgo:** bajo · medio · alto — por qué.
- **Rollback:** cómo se revierte si sale mal.
- **Feature flag:** <nombre, si aplica>
