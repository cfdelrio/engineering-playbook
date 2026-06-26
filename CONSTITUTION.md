# Constitution

> Las reglas no negociables. Todo lo demás en este repo es orientación; esto es contrato.

Si una regla de acá entra en conflicto con cualquier otro documento, **gana la Constitution**. Cambiar una regla de este archivo requiere un [ADR](./templates/adr-template.md) aprobado.

---

## Artículo 1 — Architecture First

1. Ninguna feature significativa se implementa sin una decisión de arquitectura explícita.
2. Las decisiones que afectan estructura, dependencias o límites se registran como **ADR**.
3. El código refleja la arquitectura; cuando divergen, se corrige el código o se escribe un ADR — nunca se deja la divergencia sin nombrar.

## Artículo 2 — Spec Before Code

1. Toda feature no trivial arranca con una **feature spec** ([template](./templates/feature-spec-template.md)).
2. La spec define el problema, el comportamiento esperado y los criterios de aceptación **antes** de la primera línea de implementación.
3. Si durante la implementación la realidad contradice la spec, se actualiza la spec, no se la ignora.

## Artículo 3 — Domain Driven

1. El código habla el **lenguaje del negocio** (ubiquitous language).
2. Los límites de los módulos siguen los límites del dominio, no los de la tecnología.
3. La lógica de dominio no depende de frameworks, ORMs ni detalles de infraestructura.

## Artículo 4 — Quality Gates

Ningún cambio llega a la rama principal sin pasar **todas** estas puertas:

1. ✅ Build verde.
2. ✅ Tests automatizados verdes (y cobertura de la lógica nueva).
3. ✅ Lint y formato sin errores.
4. ✅ Type checks sin errores.
5. ✅ Al menos una **PR review** aprobada (humana o IA con criterio explícito).
6. ✅ Sin secretos ni credenciales en el diff.

## Artículo 5 — Trabajo Asistido por IA

1. La IA (Claude Code) es un **par de ingeniería**, no un reemplazo del criterio.
2. Toda salida de IA se revisa con el mismo estándar que el código humano.
3. El contexto que se le da a la IA vive en [`claude/`](./claude) y se mantiene actualizado.
4. La IA nunca tiene permiso implícito para acciones destructivas o irreversibles sin confirmación.

## Artículo 6 — Seguridad por Defecto

1. Los secretos jamás se commitean. Se gestionan por entorno.
2. Toda entrada externa es no confiable hasta validarse.
3. El acceso es de mínimo privilegio por defecto.

## Artículo 7 — Observabilidad

1. Lo que no se puede observar, no está en producción de verdad.
2. Todo servicio expone logs estructurados, métricas y trazas de sus caminos críticos.

## Artículo 8 — Reversibilidad

1. Todo deploy debe poder revertirse.
2. Preferimos cambios pequeños y reversibles sobre grandes y atómicos.

---

### Enmiendas

Las reglas se modifican únicamente vía ADR aprobado. El historial de enmiendas vive en los ADRs de cada proyecto y, cuando son transversales, en este repo.
