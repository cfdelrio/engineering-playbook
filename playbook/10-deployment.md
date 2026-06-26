# 10 — Deployment

> Desplegar tiene que ser aburrido. Si da miedo, está mal hecho.

## Principios

1. **Todo deploy es reversible.** Si no podés volver atrás, no estás desplegando: estás apostando.
2. **Deploys pequeños y frecuentes.** Cuanto menos cambia un deploy, más fácil es entender qué lo rompió.
3. **Automatizado de punta a punta.** El deploy manual es el deploy que sale mal a las 3am.
4. **Separá deploy de release.** Desplegar código ≠ activar la feature. Los feature flags desacoplan ambos.

## Estrategia

```
main verde  →  build de artefacto  →  staging  →  verificación  →  producción
```

- **Staging** refleja producción lo más posible. Lo que pasa en staging predice producción.
- **Promoción**, no rebuild. El mismo artefacto que se probó en staging es el que va a producción.
- **Rollback en un comando.** Volver a la versión anterior debe ser trivial y rápido.

## Feature flags

1. Las features nuevas entran apagadas detrás de un flag.
2. Se encienden gradualmente (de a poco, observando).
3. Los flags son temporales: se limpian cuando la feature está estable. Un flag eterno es deuda.

## Migraciones de datos

Las migraciones son el deploy más peligroso porque no siempre se revierten.

1. **Compatibilidad hacia atrás.** El código viejo y el nuevo deben convivir durante la transición (expand → migrate → contract).
2. **Nunca borres en el mismo deploy en que dejás de usar.** Primero dejá de escribir, después migrá, mucho después borrá.
3. **Migraciones probadas** contra una copia realista de datos.

## Checklist de release

- [ ] Build verde y artefacto versionado.
- [ ] Probado en staging.
- [ ] Plan de rollback claro y verificado.
- [ ] Migraciones (si las hay) son compatibles hacia atrás.
- [ ] Observabilidad lista para ver el impacto ([`11-observability.md`](./11-observability.md)).
- [ ] Feature detrás de flag si es riesgosa.

## Después del deploy

Un deploy no termina cuando el artefacto está arriba. Termina cuando **verificaste** que el sistema está sano: métricas, errores, latencia. Mirá antes de irte.

---

Anterior: [`09-build.md`](./09-build.md) · Siguiente: [`11-observability.md`](./11-observability.md)
