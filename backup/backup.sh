#!/bin/bash

# === Configuration ===
BACKUP_DIR="$HOME/backups/gitea"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
GITEA_DATA_CONTAINER="gitea"
DB_CONTAINER="gitea_postgres"
DB_NAME="gitea"
DB_USER="gitea"
DB_PASS="gitea"

# === Create backup directory ===
mkdir -p "$BACKUP_DIR"

# === Backup PostgreSQL database ===
docker exec -e PGPASSWORD=$DB_PASS $DB_CONTAINER \
  pg_dump -U $DB_USER $DB_NAME > "$BACKUP_DIR/db_backup_$TIMESTAMP.sql"

# === Backup Gitea /data directory ===
docker run --rm \
  --volumes-from $GITEA_DATA_CONTAINER \
  -v "$BACKUP_DIR":/backup \
  alpine tar czf /backup/gitea_data_$TIMESTAMP.tar.gz /data

echo "Backup completed at $BACKUP_DIR"