#!/bin/bash

# Variables de configuración
MYSQL_USER="tu_usuario"
MYSQL_PASSWORD="tu_contraseña"
MYSQL_HOST="localhost"

# Comandos SQL
SQL_COMMANDS=$(cat <<EOF
CREATE SCHEMA IF NOT EXISTS \`basenmap\`;

CREATE TABLE IF NOT EXISTS \`basenmap\`.\`nmap\` (
  \`host\` VARCHAR(15) NULL,
  \`hostname\` VARCHAR(64) NULL,
  \`hostname_type\` VARCHAR(16) NULL,
  \`protocol\` VARCHAR(8) NULL,
  \`port\` VARCHAR(5) NULL,
  \`name\` VARCHAR(20) NULL,
  \`state\` VARCHAR(16) NULL,
  \`product\` VARCHAR(32) NULL,
  \`extrainfo\` VARCHAR(64) NULL,
  \`reason\` VARCHAR(16) NULL,
  \`version\` VARCHAR(32) NULL,
  \`conf\` VARCHAR(3) NULL,
  \`cpe\` VARCHAR(64) NULL
);
EOF
)

# Ejecutar los comandos SQL
mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -h $MYSQL_HOST -e "$SQL_COMMANDS"
