# Feature Spec — <nombre de la feature>

> Copiá este archivo a `docs/specs/<feature>.md` en el proyecto. Escribí la spec **antes** de implementar. Ver [`playbook/05-spec-driven-development.md`](../playbook/05-spec-driven-development.md).

| Campo | Valor |
|---|---|
| **Estado** | Borrador · En revisión · Aprobada · Implementada |
| **Autor** | <quién> |
| **Fecha** | AAAA-MM-DD |
| **Producto** | AURORA · ProdeCaballito · Engage · Storysell |
| **ADRs relacionados** | <si aplica> |

## 1. Contexto y problema

¿Qué duele hoy? ¿A quién? ¿Por qué ahora? Si no hay un problema real de un usuario real, parate acá.

## 2. Objetivo

El resultado que buscamos, medible si se puede. Qué cambia en la vida del usuario cuando esto exista.

## 3. No-objetivos

Lo que esta feature explícitamente **no** hace. Acotar es diseñar. Esta sección evita el scope creep.

## 4. Usuarios y casos de uso

Quién la usa y en qué situaciones. Historias concretas, no abstracciones.

## 5. Comportamiento esperado

El *qué*, en escenarios concretos. Formato recomendado:

```
Dado <contexto>
Cuando <acción>
Entonces <resultado observable>
```

Cubrí el camino feliz **y** los caminos de error / edge cases.

## 6. Criterios de aceptación

Condiciones verificables de "listo". Cada una debe poder volverse un test ([`playbook/07-testing.md`](../playbook/07-testing.md)).

- [ ] ...
- [ ] ...
- [ ] ...

## 7. Modelo de dominio afectado

Qué entidades, value objects, aggregates o eventos toca o crea. ¿Aparece vocabulario nuevo? ([`playbook/04-domain-driven-design.md`](../playbook/04-domain-driven-design.md))

## 8. Consideraciones

- **Seguridad / privacidad:** ¿toca datos sensibles? ([`playbook/12-security.md`](../playbook/12-security.md))
- **Observabilidad:** ¿qué hay que poder ver de esto en producción? ([`playbook/11-observability.md`](../playbook/11-observability.md))
- **Performance / escala:** límites y supuestos.
- **Migraciones / datos:** ¿requiere mover datos existentes?
- **Reversibilidad:** ¿se puede desactivar con un flag?

## 9. Preguntas abiertas

Lo que todavía no sabemos. Mejor explicitarlo que fingir certeza.

- ...
