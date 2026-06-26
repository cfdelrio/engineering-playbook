# Repository Topology Standard

> Estructura de carpetas estándar en todos nuestros proyectos.

## Plantilla

Cada proyecto sigue esta estructura:

```
PROJECT/
│
├── README.md                                    ← Punto de entrada
├── MANIFESTO.md                                 ← Qué es, para quién
├── CODE_OF_CONDUCT.md (opcional)                ← Valores
│
├── docs/
│   ├── product/
│   │   ├── vision.md                            ← Por qué existe
│   │   ├── philosophy.md                        ← Cómo pensamos
│   │   └── roadmap.md                           ← Qué viene
│   │
│   ├── domain/
│   │   ├── ubiquitous-language.md               ← Diccionario
│   │   ├── domain-model.md                      ← DDD
│   │   └── glossary.md                          ← Referencia
│   │
│   ├── architecture/
│   │   ├── README.md                            ← Índice
│   │   ├── architecture.md                      ← Visión general
│   │   ├── c4.md                                ← Diagramas C4
│   │   └── adr/
│   │       ├── README.md                        ← Índice de ADRs
│   │       ├── ADR-001-*.md
│   │       ├── ADR-002-*.md
│   │       └── archive/                         ← ADRs obsoletos
│   │           ├── ADR-001-old.md.OBSOLETE
│   │
│   ├── specs/
│   │   ├── README.md                            ← Índice de specs
│   │   ├── spec-process.md                      ← Cómo especificamos
│   │   ├── FEATURE-001-*.md
│   │   └── FEATURE-002-*.md
│   │
│   ├── runbooks/                                ← Procedimientos
│   │   ├── deployment.md
│   │   ├── incident-response.md
│   │   ├── debugging.md
│   │   └── rollback-plan.md
│   │
│   └── CLAUDE.md                                ← Contexto para Claude Code
│
├── src/                                          ← Código
│   ├── domain/                                   ← Lógica pura
│   ├── application/                             ← Casos de uso
│   ├── infrastructure/                          ← DB, APIs, archivos
│   ├── presentation/                            ← HTTP, CLI, UI
│   └── tests/                                    ← Test suites
│
├── .github/
│   ├── pull_request_template.md
│   └── workflows/                               ← CI/CD
│
├── scripts/                                      ← Utilidades
│
├── .env.example                                  ← Template de variables
├── package.json (o equivalente)
├── tsconfig.json
├── .gitignore
├── LICENSE
└── CHANGELOG.md                                  ← Histórico de cambios
```

---

## Convenciones por carpeta

### `docs/` — Toda documentación

**Regla**: Todo lo que **no es código** pero **es conocimiento** vive acá.

```
docs/
├── product/      — visión, roadmap, filosofía
├── domain/       — lenguaje, modelo, conceptos
├── architecture/ — decisiones, estructura, C4
├── specs/        — feature specs, en desarrollo
├── runbooks/     — cómo hace cosas operacionales
├── CLAUDE.md     — contexto para IA
```

No mezcles documentación en `src/`.

### `src/` — Código

**Regla**: Sigue la arquitectura del dominio.

```
src/
├── domain/           — entidades, value objects, servicios de dominio
├── application/      — casos de uso, orquestación
├── infrastructure/   — BD, parsers, integraciones
├── presentation/     — HTTP, CLI, lo que ve el usuario
└── tests/            — unitarios, integración, e2e
```

No mezcles código de base datos con dominio.

### `docs/architecture/adr/` — Decisiones

```
adr/
├── README.md                        ← índice, lista vigentes + obsoletos
├── ADR-001-feature.md               ← numeradas secuencialmente
├── ADR-002-another.md
├── archive/
│   ├── ADR-001-old.md.OBSOLETE      ← renombrados con .OBSOLETE
│   └── ADR-002-old.md.OBSOLETE
```

No borres ADRs viejos. Archívalos.

### `docs/specs/` — Features

```
specs/
├── README.md                        ← índice
├── FEATURE-001-my-feature.md        ← FEATURE-NNN-nombre
├── FEATURE-002-another.md
```

Cuando completado: marca status como "Released". No borres.

---

## Métodos de organización

### Opción A: Por funcionalidad (Recomendado para dominio claro)

```
src/
├── training/              ← Training Bounded Context
│   ├── domain/
│   ├── application/
│   └── infrastructure/
├── athlete/               ← Athlete Bounded Context
│   ├── domain/
│   ├── application/
│   └── infrastructure/
└── analysis/              ← Analysis Bounded Context
    ├── domain/
    ├── application/
    └── infrastructure/
```

**Para AURORA**: training, athlete, analysis, prediction.

### Opción B: Por capa (Aceptable para pequeño proyecto)

```
src/
├── domain/
│   ├── athlete.ts
│   ├── workout.ts
│   └── training-metrics.ts
├── application/
│   └── upload-workout.ts
└── infrastructure/
    ├── database/
    ├── parsers/
    └── events/
```

**Limitación**: Crece lentamente. Después necesita refactor.

---

## Convenciones de naming

- **Carpetas**: `snake_case`.
- **Archivos de dominio**: PascalCase (`Athlete.ts`).
- **Archivos de utilidad**: `camelCase` (`parseWorkout.ts`).
- **Tests**: `*.test.ts` o `*.spec.ts`.

---

## README en cada carpeta

Carpetas principales llevan `README.md`:

```markdown
# domain/

Lógica de negocio pura de [nombre del contexto].

## Conceptos

- Athlete: ...
- Workout: ...

## Entrada

Usa `application/` para orquestar.

## Testing

Tests de dominio en `tests/domain/`.
```

---

## Lo que NO va en carpetas

❌ Código duplicado o "utils" genéricos.
❌ Lógica de infraestructura en dominio.
❌ Documentación de features en `src/`.
❌ Archivos temporales o de debugging.

✅ Todo tiene su lugar.

---

Siguiente: [`naming.md`](./naming.md)
