#!/bin/bash

DB_NAME="cmm"
echo "Init databases..............."
TABLE_COUNT=$(mysql -u root -pcmmRoot@2025 -N -s -e \
"SELECT COUNT(*) FROM information_schema.tables WHERE table_schema='${DB_NAME}';")

if [ "$TABLE_COUNT" -gt 0 ]; then
  echo "✅ DB $DB_NAME đã có dữ liệu → bỏ qua import"
else
  echo "🚀 DB rỗng → import dữ liệu"
  mysql -u root -pcmmRoot@2025 < /docker-entrypoint-initdb.d/cmm.sql
fi
