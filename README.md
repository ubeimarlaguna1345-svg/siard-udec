# SIARD-UdeC

Sistema Integral de Autoevaluación y Retroalimentación Docente.
Proyecto de Gestión del Conocimiento (PGC), Ingeniería de Sistemas y Computación, Universidad de Cundinamarca, sede Facatativá.

## Base de datos (PostgreSQL)

1. Crea la base de datos:

```
CREATE DATABASE siard_db;
```

2. En PowerShell, desde la carpeta del proyecto, ejecuta el esquema:

```
$env:PGCLIENTENCODING="UTF8"
psql -U postgres -d siard_db -f database/schema.sql
```

3. (Opcional) Carga los datos de prueba, que son ficticios:

```
psql -U postgres -d siard_db -f database/datos_prueba.sql
```

## Backend

En `backend/src/main/resources/` copia `application.properties.example` como `application.properties` y cambia la contraseña por la de tu PostgreSQL. Ese archivo no se sube a Git.