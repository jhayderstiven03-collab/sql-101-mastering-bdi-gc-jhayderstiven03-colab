# Primer Script
python .\01-create-database\01-sql-ddl-script-auto.py --sql-dir ../ddl --user postgres --password "*****" --host localhost --port 5432 --database postgres --create-script true
# Segundo Script
python .\01-create-database\01-sql-ddl-script-auto.py --sql-dir ../ddl --user sm_admin --password "qTGkUYE6rm0ZEMdB9sYkRJwwPuYdJioY" --host  dpg-d4gu4hpr0fns739sudp0-a.oregon-postgres.render.com--port 5432 --database smart_health_ffru