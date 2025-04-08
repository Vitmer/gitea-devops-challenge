#!/bin/bash

# Настройки
BACKUP_DIR="$HOME/backups/gitea"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
GITEA_DATA_CONTAINER="gitea"
DB_CONTAINER="gitea_postgres"
DB_NAME="gitea"
DB_USER="gitea"
DB_PASS="gitea"

# Создание каталога для бэкапов
mkdir -p "$BACKUP_DIR"

# Бэкап базы данных
docker exec -e PGPASSWORD=$DB_PASS $DB_CONTAINER \
  pg_dump -U $DB_USER $DB_NAME > "$BACKUP_DIR/db_backup_$TIMESTAMP.sql"

# Бэкап /data из Gitea
docker run --rm \
  --volumes-from $GITEA_DATA_CONTAINER \
  -v "$BACKUP_DIR":/backup \
  alpine tar czf /backup/gitea_data_$TIMESTAMP.tar.gz /data

echo "✅ Backup completed at $BACKUP_DIR"