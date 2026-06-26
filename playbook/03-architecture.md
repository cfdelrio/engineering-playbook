# 03 — Architecture First

> Decidimos la forma del sistema antes de escribir el código que la rellena.

## Qué significa "Architecture First"

No es diseñar todo por adelantado. Es **tomar las decisiones estructurales de forma consciente y temprana**, registrarlas, y dejar que guíen la implementación — en vez de descubrir la arquitectura por accidente después de seis meses de parches.

## Las decisiones que sí importan

Architecture First aplica a decisiones que son **caras de revertir**:

- Límites de módulos / servicios.
- Dirección de las dependencias.
- Modelo de datos y dónde vive la verdad.
- Contratos entre componentes (APIs, eventos, esquemas).
- Estrategia de estado, concurrencia y consistencia.
- Puntos de integración con terceros.

No aplica al color de un botón ni al nombre de una variable local. Reservá la ceremonia para lo irreversible.

## Reglas de oro

1. **Las dependencias apuntan hacia adentro.** El dominio no conoce la infraestructura. La infraestructura conoce al dominio. (Arquitectura hexagonal / puertos y adaptadores como default.)
2. **Aislá lo que cambia rápido de lo que cambia lento.** El dominio cambia lento; los frameworks y proveedores, rápido. No los acoples.
3. **Hacé explícitos los contratos.** Todo límite tiene un contrato declarado (tipos, esquema, interfaz). Los límites implícitos se erosionan.
4. **Una razón para cambiar por módulo.** Si un módulo cambia por dos motivos distintos del negocio, probablemente son dos módulos.
5. **La arquitectura es testeable.** Si no podés testear la lógica de dominio sin levantar la base de datos, la arquitectura está mal.

## Forma por defecto

Salvo que un ADR diga lo contrario:

```
┌─────────────────────────────────────────┐
│  Adaptadores (HTTP, CLI, UI, jobs)        │  ← detalles, cambian rápido
├─────────────────────────────────────────┤
│  Aplicación (casos de uso, orquestación)  │  ← coordina el dominio
├─────────────────────────────────────────┤
│  Dominio (entidades, reglas, lenguaje)    │  ← el corazón, sin dependencias
├─────────────────────────────────────────┤
│  Infraestructura (DB, APIs, colas)        │  ← detrás de puertos/interfaces
└─────────────────────────────────────────┘
```

## ADRs — Architecture Decision Records

Toda decisión estructural se registra con el [template de ADR](../templates/adr-template.md).

Un ADR captura: **contexto** (qué nos llevó acá), **decisión** (qué elegimos), **alternativas** (qué descartamos y por qué) y **consecuencias** (qué ganamos y qué pagamos).

Un ADR no se borra: se marca como *superseded* por otro. La historia de por qué el sistema es como es vale tanto como el sistema.

## Cuándo escribir un ADR

- Introducís o quitás una dependencia mayor.
- Cambiás un límite o un contrato entre componentes.
- Elegís entre dos enfoques con consecuencias a largo plazo.
- Alguien en el futuro va a preguntar "¿por qué está hecho así?".

---

Anterior: [`02-principles.md`](./02-principles.md) · Siguiente: [`04-domain-driven-design.md`](./04-domain-driven-design.md)
