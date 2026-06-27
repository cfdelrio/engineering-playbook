# Engineering Maturity Levels (EML)

> Marco para evaluar y planificar la madurez de ingeniería de un proyecto.

## Concepto

Un EML es el nivel mínimo de práctica de ingeniería que un proyecto debe mantener, determinado por su criticidad, tamaño de equipo e impacto en usuarios.

No es una ranking de "mejor a peor". Es un contrato entre el equipo y el proyecto:
**"Para este tipo de proyecto, estas son las prácticas no negociables."**

---

## Los 6 niveles

### EML-0 — Legacy

Proyectos sin desarrollo activo. Modo mantenimiento mínima.

**Aplica cuando**: El proyecto está en sunset, nadie lo mantiene activamente, o es pre-cualquier-estándar.

**Expectativa**: No romper lo que funciona. No agregar deuda.

---

### EML-1 — Bootstrap

Proyecto nuevo o exploración. Velocidad sobre proceso.

**Aplica cuando**: Prototipo, MVP, exploración técnica, proyecto personal sin usuarios reales.

---

### EML-2 — Foundational

Proyecto funcional, equipo pequeño, usuarios internos o limitados.

**Aplica cuando**: Herramientas internas, proyectos de un equipo, plataformas sin SLA crítico.

---

### EML-3 — Operational

Proyecto con usuarios reales, entregando valor en producción.

**Aplica cuando**: Producto con usuarios externos, necesita confiabilidad básica.

---

### EML-4 — Professional

Producto crítico, equipo múltiple, clientes dependen de él.

**Aplica cuando**: Plataformas de negocio, servicios con SLA, impacto significativo en usuarios.

---

### EML-5 — Engineering Excellence

Plataforma de misión crítica, alta disponibilidad, equipo senior.

**Aplica cuando**: Infraestructura core, servicios financieros, seguridad o salud, multi-región.

---

## Tabla comparativa

| Dimensión | EML-0 | EML-1 | EML-2 | EML-3 | EML-4 | EML-5 |
|---|---|---|---|---|---|---|
| **Documentación** | — | README | README + Domain model | + ADRs para cambios estructurales | + Spec para toda feature | + APIs documentadas públicamente |
| **Testing** | — | Manual | Unit tests (dominio) | + Integration tests | + E2E tests | + Mutation, property-based, chaos |
| **CI/CD** | — | Manual deploy | Linting + unit tests automáticos | + Deploy a staging automático | + Smoke tests en producción | + Blue-green / canary / rollback automático |
| **Observabilidad** | — | Logs básicos | + Error tracking (Sentry) | + Métricas clave (latencia, errores) | + Distributed tracing, alertas | + SLOs definidos, on-call runbooks |
| **Seguridad** | — | .env.example | + OWASP top 10 checklist | + Dependabot, auditoría de deps | + Code scanning, secrets scan | + Penetration test periódico, rotación de secrets |
| **Arquitectura** | — | Sin restricción | README de arquitectura | + ADRs committeados | + C4 model documentado | + Architecture review board |
| **Code Review** | — | Sin PR | 1 revisor | 2 revisores (1 senior) | Staff Engineer aprueba releases | CTO sign-off para cambios en CONSTITUTION |
| **Release** | — | Push directo | Tags semánticos | + CHANGELOG requerido | + Release notes + comunicación | + Post-release monitoring, rollback plan |

---

## Detalles por dimensión

### Documentación

**EML-1**: README explica qué hace el proyecto y cómo correrlo.

**EML-2**: + `docs/domain/` con modelo de dominio básico. Lenguaje ubicuo definido.

**EML-3**: + ADRs para decisiones estructurales. Cada feature mayor tiene spec.

**EML-4**: + Toda feature tiene spec completa (product brief + domain spec + tech spec). No se escribe código sin spec aprobada.

**EML-5**: + APIs públicas con documentación interactiva. Runbooks para cada modo de falla conocido.

---

### Testing

**EML-1**: Los desarrolladores verifican manualmente antes de push.

**EML-2**: Tests unitarios del dominio. Cobertura mínima del 60% en `domain/`.

**EML-3**: Tests de integración para todos los casos de uso. Tests de contrato para APIs externas.

**EML-4**: Tests E2E para el golden path de cada feature crítica. Performance tests antes de releases mayores.

**EML-5**: Mutation testing para verificar que los tests realmente detectan bugs. Property-based testing para dominios complejos. Chaos engineering para validar resiliencia.

---

### CI/CD

**EML-1**: El deploy es manual pero documentado (ej: `scripts/deploy.sh`).

**EML-2**: GitHub Actions (o equivalente) con linting y unit tests en cada PR. No se mergea PR que falla CI.

**EML-3**: Deploy automático a staging en merge a main. Los tests de integración corren en staging.

**EML-4**: Smoke tests automáticos en producción post-deploy. Rollback documentado y testado.

**EML-5**: Blue-green o canary deployment. Rollback automático si métricas degradan. Feature flags para releases graduales.

---

### Observabilidad

**EML-1**: `console.log`. Suficiente para desarrollo.

**EML-2**: Error tracking (Sentry o similar). Notificación en errores 5xx.

**EML-3**: Métricas de negocio (requests, latencia p95, error rate). Dashboard básico.

**EML-4**: Distributed tracing (Datadog, Honeycomb). Alertas definidas con thresholds. On-call rotation.

**EML-5**: SLOs definidos y medidos. Error budgets. Runbooks para cada alerta. Post-mortems documentados.

---

### Seguridad

**EML-1**: Secrets en `.env`, `.env` en `.gitignore`. Nada más.

**EML-2**: Checklist OWASP Top 10 antes de cada release. Revisión de dependencias con vulnerabilidades conocidas.

**EML-3**: Dependabot o Renovate activos. Auditoría de deps en CI.

**EML-4**: GitHub Code Scanning (SAST). Secrets scanning activo. Política de rotación de credentials.

**EML-5**: Penetration testing periódico (anual mínimo). Threat modeling documentado. Política de divulgación responsable.

---

## Recomendaciones por proyecto

| Proyecto | EML Recomendado | Justificación |
|---|---|---|
| **AURORA** | EML-4 | Plataforma de inteligencia, datos de salud/rendimiento de atletas, múltiples bounded contexts, necesita confiabilidad alta |
| **Engage** | EML-3 | Plataforma de engagement con usuarios externos, necesita observabilidad básica y CI/CD sólido |
| **ProdeCaballito** | EML-2 | Herramienta interna/comunitaria, equipo pequeño, impacto acotado |
| **Storysell** | EML-2 | Plataforma de contenido, riesgo bajo, equipo chico |

---

## Cómo usar los EML

### Al iniciar un proyecto

1. Definir el EML objetivo en el README
2. Configurar lo mínimo del nivel elegido antes del primer release
3. Documentar la decisión como ADR: `ADR-001-engineering-maturity-level.md`

### Al crecer un proyecto

Subir de EML es una decisión explícita, no gradual:

1. Identificar que el proyecto superó su EML actual (más usuarios, más crítico, más equipo)
2. Crear ADR documentando el cambio de nivel
3. Crear un spike de 1-2 sprints para implementar los requisitos del nuevo nivel
4. No continuar agregando features hasta completar la migración de nivel

### Al evaluar un proyecto existente

Usar la tabla de dimensiones como checklist. Cada dimensión que no cumple = gap de madurez.

---

## Anti-patrones

❌ **"Vamos a implementar EML-5 desde el día 1."**
Resultado: Proceso sofocante que mata la velocidad en la etapa exploratoria.

❌ **"EML no aplica a nosotros, somos una startup."**
Resultado: Deuda técnica acumulada sin framework para pagarla.

❌ **"Subimos a EML-4 gradualmente."**
Resultado: Nunca se completa. Los gaps de EML se van llenando de manera inconsistente.

✅ **Elegir el EML correcto para el momento del proyecto, y cambiar deliberadamente.**

---

Anterior: [`versioning.md`](./versioning.md) · Siguiente: [`release-checklist.md`](./release-checklist.md) · [Índice](./README.md)
