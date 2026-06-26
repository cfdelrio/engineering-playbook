# 12 — Seguridad

> Seguridad por defecto, no como parche. La seguridad que se agrega al final, no llega.

## Mentalidad

Asumimos que **todo lo externo es hostil hasta que se demuestre lo contrario**: la entrada del usuario, la respuesta de una API, el contenido de un archivo, el header de una request. La paranoia razonable es profesionalismo.

## Reglas no negociables

1. **Cero secretos en el repo.** Nunca. Ni en código, ni en config, ni en historia de git. Los secretos viven en variables de entorno / gestor de secretos por ambiente.
2. **Validá toda entrada externa.** En el borde, antes de que toque la lógica. Lo que no validás, te valida a vos.
3. **Mínimo privilegio.** Cada componente, credencial y usuario tiene el menor acceso que le permita funcionar. Nada más.
4. **Nunca confíes en el cliente.** Toda validación y autorización crítica ocurre en el servidor.
5. **No loguees datos sensibles.** Contraseñas, tokens, PII sensible — jamás en logs ni en mensajes de error.

## Autenticación y autorización

- **Autenticación**: verificamos quién sos con mecanismos probados. No inventamos cripto propia.
- **Autorización**: verificamos qué podés hacer en *cada* acción sensible, no solo al entrar.
- Las sesiones / tokens expiran y se pueden revocar.

## Datos

1. **Cifrado en tránsito** siempre (TLS). Sin excepciones.
2. **Cifrado en reposo** para datos sensibles.
3. **Minimización**: no guardamos datos personales que no necesitamos. El dato que no tenés no se puede filtrar.
4. **Cumplimiento**: respetamos las obligaciones legales de cada producto (privacidad, retención).

## Dependencias

1. **Escaneo de vulnerabilidades** en CI ([`09-build.md`](./09-build.md)).
2. **Actualizaciones al día**, especialmente de seguridad.
3. **Menos dependencias = menos superficie.** Cada dependencia es código de otro que corre con tus permisos.

## Manejo de secretos y configuración

```
Código  →  lee de  →  Variables de entorno / Secret Manager
                       (distintas por ambiente, nunca en el repo)
```

## Seguridad y trabajo con IA

1. Claude Code **nunca** debe recibir secretos reales en prompts ni en archivos de contexto.
2. Acciones destructivas o sensibles (borrar datos, tocar producción, mover dinero) requieren **confirmación humana explícita**.
3. Toda salida de IA que toque seguridad se revisa con doble cuidado.

## Respuesta a incidentes

Cuando algo se filtra o se rompe: contené primero, comunicá rápido, hacé post-mortem sin culpa después. El objetivo es aprender, no castigar.

---

Anterior: [`11-observability.md`](./11-observability.md) · Siguiente: [`13-ai-assisted-engineering.md`](./13-ai-assisted-engineering.md)
