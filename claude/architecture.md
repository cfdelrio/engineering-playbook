# Claude — Arquitectura y Dominio

> Cómo respetás la arquitectura y el dominio al trabajar. Doctrina completa: [`playbook/03-architecture.md`](../playbook/03-architecture.md) y [`playbook/04-domain-driven-design.md`](../playbook/04-domain-driven-design.md).

## Antes de tocar estructura

1. **Identificá si el cambio es estructural** — toca límites, dependencias, contratos o el modelo de datos. Si lo es, no improvises: requiere una decisión explícita (ADR).
2. **Si no hay ADR y el cambio lo amerita**, proponé uno usando el [template](../templates/adr-template.md) antes de implementar.
3. **Leé los ADRs existentes** (`docs/adr/`) para no contradecir decisiones ya tomadas.

## Reglas de arquitectura que aplicás siempre

1. **Las dependencias apuntan hacia adentro.** El dominio no importa infraestructura (ni ORM, ni HTTP, ni SDK de proveedor). La infraestructura depende del dominio, nunca al revés.
2. **Aislá lo que cambia rápido (frameworks, proveedores) de lo que cambia lento (dominio).** No los acoples.
3. **Contratos explícitos en cada límite.** Tipos, esquemas, interfaces. Nada de acoplamiento implícito.
4. **La lógica de dominio es testeable sin infraestructura.** Si para testear una regla necesitás levantar la DB, está mal ubicada.

## Forma por defecto

Salvo ADR en contrario: adaptadores → aplicación → dominio, con infraestructura detrás de puertos. El corazón (dominio) no tiene dependencias externas.

## Dominio: lenguaje ubicuo

1. **Usá los términos del negocio.** Si el proyecto define un `domain-model.md`, esos nombres mandan. No inventes sinónimos ni traduzcas.
2. **Modelá comportamiento, no solo datos.** Las reglas viven en las entidades/aggregates, no en servicios anémicos que mueven structs.
3. **Las invariantes viven en el aggregate.** Un aggregate nunca debe poder quedar en estado inválido.
4. **Respetá los bounded contexts.** No cruces modelos internos entre contextos; comunicá por contratos.

## Cuando dudes

Si un cambio te obliga a romper una de estas reglas para que "funcione", **pará y avisá**. Romper la arquitectura para entregar rápido es deuda que paga otro (o vos en tres meses).
