# Laboratorio 03 - CI/CD Liquibase + GitHub Actions + Databricks

Proyecto base ejecutable para obtener las evidencias del Laboratorio 03.

IMPORTANTE: Este laboratorio es continuación del Lab 02. Si ya tienes el repositorio del Lab 02, conserva tu changeset 001 original y agrega solamente el changeset 002 de este paquete. No reemplaces un 001 que ya haya sido desplegado.

## Antes de usar
1. Reemplaza `CODIGO_ESTUDIANTE` en `changelog/db.changelog-master.sql` por tu código.
2. En GitHub > Settings > Secrets and variables > Actions crea:
   - DATABRICKS_HOST
   - DATABRICKS_HTTP_PATH
   - DATABRICKS_TOKEN
   - DATABRICKS_CATALOG
3. Nunca publiques tu token.

## Flujo del Lab 03
- Crear rama: `git switch -c feature/create-staging-schema`
- Commit y push.
- Crear Pull Request a main: CI valida sin desplegar.
- Verificar en Databricks que staging aún NO existe.
- Hacer merge a main: CD despliega.
- Verificar Unity Catalog y DATABASECHANGELOG.
- En Actions ejecutar manualmente CD otra vez: debe haber 0 changesets pendientes.
