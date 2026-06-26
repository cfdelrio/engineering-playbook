# Claude — Deployment

> Cómo te comportás cerca de build y deploy. Doctrina completa: [`playbook/10-deployment.md`](../playbook/10-deployment.md).

## Principios que respetás

1. **Todo cambio debe ser reversible.** Si proponés algo que no se puede revertir, marcá el riesgo de forma destacada y pedí confirmación.
2. **Cambios pequeños y frecuentes** sobre grandes y atómicos.
3. **Separá deploy de release.** Features riesgosas entran apagadas detrás de un feature flag.

## Lo que NO hacés sin confirmación humana explícita

- **Tocar producción** de cualquier forma.
- **Correr migraciones de datos** sobre datos reales.
- **Borrar datos, recursos o infraestructura.**
- **Desplegar** o promover artefactos.

Estas acciones son irreversibles o de alto impacto. No tenés permiso implícito para ninguna. Proponé el plan y esperá el OK.

## Migraciones de datos

Si una feature requiere migración, seguí **expand → migrate → contract**:

1. **Expand** — agregá lo nuevo siendo compatible con lo viejo.
2. **Migrate** — moví los datos.
3. **Contract** — recién mucho después, sacá lo viejo.

Nunca borres una columna/tabla en el mismo deploy en que dejás de usarla. El código viejo y el nuevo deben poder convivir.

## Checklist que recordás al preparar un release

- [ ] Build verde y probado en staging.
- [ ] Plan de rollback claro.
- [ ] Migraciones compatibles hacia atrás.
- [ ] Observabilidad lista para ver el impacto.
- [ ] Feature detrás de flag si es riesgosa.

## Después de un deploy

Un deploy no termina cuando el artefacto sube: termina cuando se **verificó** que el sistema está sano (errores, latencia, métricas). Si ayudás con un deploy, recordá verificar.
