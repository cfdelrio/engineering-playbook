# 08 — Code Review

> La review no es un trámite. Es donde la calidad y el conocimiento se reparten.

## Para qué hacemos review

1. **Correctitud** — ¿hace lo que la spec dice, sin romper otra cosa?
2. **Claridad** — ¿lo va a entender quien venga después?
3. **Coherencia** — ¿respeta la arquitectura, el dominio y los patrones del repo?
4. **Difusión de conocimiento** — nadie debería ser el único que entiende una parte.

No hacemos review para lucirnos ni para imponer gustos personales.

## El autor: cómo preparar una PR

1. **PR chica.** Si pasa de ~400 líneas de diff, partila. Las PRs grandes reciben reviews malas.
2. **Usá el [template de PR](../templates/pr-template.md).** Contexto, qué cambia, cómo se probó, link a la spec.
3. **Dejá el árbol verde.** Build, tests, lint y types en verde *antes* de pedir review.
4. **Auto-review primero.** Leé tu propio diff antes de mandarlo. La mitad de los comentarios te los ahorrás solo.
5. **Explicá lo no obvio** en la descripción o con comentarios en el código.

## El revisor: cómo revisar

1. **Empezá por la spec.** Revisás contra lo que se quería lograr, no contra lo que vos hubieras hecho.
2. **Distinguí bloqueante de sugerencia.** Marcá claramente qué frena el merge y qué es opcional (`nit:`).
3. **Atacá el código, cuidá a la persona.** Comentás el cambio, no a quien lo escribió.
4. **Preguntá antes de asumir.** "¿Por qué así?" enseña más que "esto está mal".
5. **Aprobá cuando esté bien, no cuando sea perfecto.** Lo perfecto es enemigo de lo entregado. Si es mejor que lo que había y cumple las gates, va.

## Niveles de comentario

| Prefijo | Significado |
|---|---|
| `blocking:` | No se mergea hasta resolverlo. |
| `question:` | Necesito entender antes de aprobar. |
| `nit:` | Detalle menor, opcional. |
| `praise:` | Esto está bien, dejémoslo registrado. |

## Review asistida por IA

Claude Code puede hacer una primera pasada de review (correctitud, bugs, simplificaciones). Eso **no reemplaza** la review humana del criterio de diseño y producto, pero sí eleva el piso: que el humano no gaste su atención en lo que una máquina detecta.

Cuando la IA aprueba, el criterio explícito de por qué queda registrado. La IA nunca aprueba "porque sí".

## Quality gates (recordatorio)

Ninguna PR se mergea sin pasar las [gates de la Constitution](../CONSTITUTION.md#artículo-4--quality-gates).

---

Anterior: [`07-testing.md`](./07-testing.md) · Siguiente: [`09-build.md`](./09-build.md)
