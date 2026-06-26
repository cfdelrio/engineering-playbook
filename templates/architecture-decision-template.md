# Architecture Decision — <título>

> Documento de diseño de arquitectura, más amplio que un ADR puntual. Usalo para diseñar un subsistema o una capa antes de partirlo en ADRs y specs. Un ADR registra *una* decisión; este documento explora *el diseño* del que salen varias decisiones. Ver [`playbook/03-architecture.md`](../playbook/03-architecture.md).

| Campo | Valor |
|---|---|
| **Estado** | Borrador · En revisión · Aprobado |
| **Autor** | <quién> |
| **Fecha** | AAAA-MM-DD |
| **Alcance** | <qué subsistema / capa cubre> |

## 1. Problema de diseño

Qué necesitamos diseñar y por qué. Las fuerzas en juego: requisitos funcionales, restricciones, atributos de calidad (performance, escala, seguridad, mantenibilidad).

## 2. Requisitos y restricciones

- **Funcionales:** qué tiene que hacer.
- **No funcionales:** latencia, escala, disponibilidad, seguridad.
- **Restricciones:** stack existente, presupuesto, plazos, integraciones obligatorias.

## 3. Diseño propuesto

La forma del sistema. Componentes, responsabilidades y cómo se relacionan.

```
<diagrama ASCII o descripción de componentes y dependencias>
```

- **Componente A** — responsabilidad, qué conoce, qué no.
- **Componente B** — ...
- **Dirección de dependencias** — hacia el dominio.

## 4. Contratos y límites

Las interfaces entre componentes. Qué cruza cada límite (datos, eventos, llamadas) y bajo qué contrato explícito.

## 5. Alternativas de diseño

Los enfoques que consideramos y por qué este gana.

- **Enfoque A** — trade-offs.
- **Enfoque B** — trade-offs.

## 6. Atributos de calidad

Cómo este diseño satisface (o sacrifica) cada atributo:

| Atributo | Cómo lo aborda |
|---|---|
| Performance | ... |
| Escalabilidad | ... |
| Seguridad | ... |
| Observabilidad | ... |
| Testabilidad | ... |

## 7. Decisiones derivadas (ADRs)

Las decisiones puntuales que salen de este diseño y se registran como ADRs:

- [ ] ADR-NNNN — ...
- [ ] ADR-NNNN — ...

## 8. Riesgos y mitigaciones

- **Riesgo:** ... → **Mitigación:** ...
