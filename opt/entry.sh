#!/bin/bash

# Setze Standardwerte, falls Umgebungsvariablen nicht gesetzt sind
export MAX_PLAYERS="${MAX_PLAYERS:=2}"
export DIFFICULTY="${DIFFICULTY:=easy}"
export GAMEMODE="${GAMEMODE:=survival}"
export MOTD="${MOTD:=A Minecraft Server}"
export ALLOW_FLIGHT="${ALLOW_FLIGHT:=false}"
export ALLOW_NETHER="${ALLOW_NETHER:=true}"
export RCON_PW="${RCON_PW:=}"

# Erstelle eine Backup-Kopie der originalen server.properties
cp /app/server.properties /app/server.properties.bak || true

# Konfiguriere die server.properties-Datei
{
  echo "max-players=$MAX_PLAYERS"
  echo "difficulty=$DIFFICULTY"
  echo "gamemode=$GAMEMODE"
  echo "motd=$MOTD"
  echo "allow-flight=$ALLOW_FLIGHT"
  echo "allow-nether=$ALLOW_NETHER"
  echo "rcon.password=$RCON_PW"
} > /app/server.properties

echo "eula=$EULA" > /app/eula.txt

# Starte den Minecraft-Server
exec java -Xmx1024M -Xms1024M -jar /opt/server.jar nogui