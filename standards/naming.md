# Naming Standard

> Cómo nombramos cosas: archivos, funciones, variables, tipos.

## Principio rector

**El nombre dice la verdad.** Alguien que lea solo el nombre debe entender 80% de qué hace.

❌ `process(data)` — ¿Qué procesa? ¿Cómo?
✅ `normalizeWorkoutStreams(rawFitData)` — Claro.

---

## Archivos y carpetas

### Carpetas
- **snake_case** siempre.
- **Singular si es contexto, plural si es colección**.
  - ✅ `src/domain/` (contexto de dominio)
  - ✅ `docs/architecture/adr/` (colección de ADRs)

### Archivos

**Dominio** (entidades, VOs, servicios):
- **PascalCase**.
- **Nombre = Concepto de dominio**.
- ✅ `Athlete.ts`, `Workout.ts`, `TrainingMetrics.ts`

**Utilidades e infraestructura**:
- **camelCase**.
- **Verbo sugiere acción**.
- ✅ `parseWorkout.ts`, `normalizeStreams.ts`, `calculateLoad.ts`

**Tests**:
- **PascalCase + `.test.ts` o `.spec.ts`**.
- ✅ `Athlete.test.ts`, `TrainingMetrics.spec.ts`

---

## Tipos y Interfaces (TypeScript)

### Entidades
```typescript
class Athlete { }          // PascalCase, class

// Value Objects
class TrainingMetrics { }  // PascalCase, class
class Duration { }         // PascalCase, class
```

### Interfaces y tipos
```typescript
interface Repository<T> { }           // PascalCase
type WorkoutType = "bike" | "run";    // PascalCase para alias
type LoadValue = number;              // PascalCase para alias
```

### Enums (lista de opciones)
```typescript
enum FatigueState {
  Fresh = "fresh",
  Fatigued = "fatigued",
  Overreached = "overreached",
}
```

---

## Funciones y métodos

### Funciones de dominio
```typescript
// Nombre = qué transforman
const normalizeWorkout = (raw: RawWorkout) => NormalizedWorkout
const calculateLoad = (metrics: Metrics) => number
const detectFatigueState = (load: Load) => FatigueState

// Método de dominio
class Athlete {
  addWorkout(w: Workout): void { }
  getForm(): Form { }
  getRiskScore(): number { }
}
```

### Funciones de utilidad
```typescript
const parseWorkoutFit = (bytes: Buffer) => RawWorkout
const toISODate = (date: Date) => string
const groupByWeek = (workouts: Workout[]) => Map<Week, Workout[]>
```

### Booleanos y predicados
```typescript
const isOvertrained = (state: State) => boolean
const hasValidMetrics = (w: Workout) => boolean
const shouldRest = (load: Load) => boolean
```

---

## Variables

### Local
- **camelCase**.
- **Específico, no genérico**.
- ✅ `const athleteLoad = ...` (no `const load`)
- ✅ `const weeklyMetrics = ...` (no `const metrics`)

### Constants
- **UPPER_SNAKE_CASE** si son configurables globales.
- **camelCase** si son constantes de dominio.

```typescript
// Config global
const MAX_WEEKLY_LOAD = 1000;
const GEAR_RATIOS = { /* ... */ };

// Dominio
const ftp = athlete.thresholdPower;
const zones = athlete.trainingZones;
```

---

## Documentación y adocs

### Archivos de documentación
- **snake_case-dash-separated.md** si es descriptivo.
- **ADR-NNN-title.md** si es ADR.
- **FEATURE-NNN-title.md** si es spec.

```
├── ADR-001-engine-separation.md
├── FEATURE-002-load-calculator.md
├── decision-framework.md
```

### Headings
- **Title Case** para títulos.
- **Normal case** para secciones.

```markdown
# Architecture Decisions

## Context

## Decision

###Field-specific rules
```

---

## Lenguaje ubicuo

**Regla de oro**: El código usa exactamente los términos del dominio. Sin traducción, sin sinónimo.

Dominio dice → Código dice:
- "Atleta" → `Athlete`
- "Entrenamiento" → `Workout`
- "Carga de entrenamiento" → `TrainingLoad`
- "Zona de entrenamiento" → `TrainingZone`

**No**:
- ✅ `Athlete` (dominio: atleta)
- ❌ `User` (confuso, no es lo mismo)
- ❌ `Person` (demasiado genérico)

---

## Antipatrones

❌ **Nombres técnicos en dominio**:
- `EventStore` (bueno para infra, malo para dominio)
- `Repository<T>` (patrón técnico, pero bien en contexto)
- `Controller` (no es un concepto de dominio)

✅ **Nombres de dominio en dominio**:
- `Athlete`, `Workout`, `TrainingMetrics`
- `calculateForm()`, `detectFatigue()`

---

❌ **Abreviaturas no obvias**:
- `calc_load()` → Qué calcula?
- `proc_data()` → Procesa cómo?

✅ **Nombres completos**:
- `calculateWeeklyLoad()`
- `processRawFitData()`

---

❌ **Nombres genéricos**:
- `data`, `item`, `value`, `result`

✅ **Específicos**:
- `athleteData` → `athlete`
- `workoutItem` → `workout`
- `calculatedValue` → `trainingLoad`

---

## Checklista

Antes de commitear código:

- [ ] Archivos: snake_case (carpetas), PascalCase (dominio), camelCase (utilidad).
- [ ] Tipos: PascalCase.
- [ ] Funciones: camelCase, verbo sugiere acción.
- [ ] Variables: camelCase, específico.
- [ ] Lenguaje ubicuo: sin sinónimos, sin traducción.
- [ ] Sin abreviaturas (excepto estándar: bpm, ftp).
- [ ] Tests: mismo nombre que código + `.test.ts`.

---

Siguiente: [`versioning.md`](./versioning.md)
