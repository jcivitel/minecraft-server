# Minecraft Server Docker Image

[![Maintenance](https://img.shields.io/maintenance/yes/2024)](https://github.com/jcivitel/)
[![GitHub](https://img.shields.io/badge/GitHub-jcivitell-green?logo=github)](https://github.com/jcivitel/minecraft-server)
[![GitHub Repo stars](https://img.shields.io/github/stars/jcivitel/minecraft-server)](https://github.com/jcivitel/minecraft-server)
[![Docker Pulls](https://img.shields.io/docker/pulls/jcivitell/minecraft-server?logo=docker)](https://hub.docker.com/r/jcivitell/minecraft-server)
[![Docker Stars](https://img.shields.io/docker/stars/jcivitell/minecraft-server?logo=docker)](https://hub.docker.com/r/jcivitell/minecraft-server)
[![Docker Image Size](https://img.shields.io/docker/image-size/jcivitell/minecraft-server/latest?logo=docker)](https://hub.docker.com/r/jcivitell/minecraft-server)

## Supported tags and respective `Dockerfile` links
- [`latest` (*Dockerfile*)](https://github.com/jcivitel/minecraft-server/blob/main/Dockerfile)

## What is Minecraft?
Minecraft is a sandbox video game developed by Mojang Studios. The game allows players to build with a variety of different blocks in a 3D procedurally generated world, requiring creativity from players. Other activities in the game include exploration, resource gathering, crafting, and combat.

This Docker image contains the dedicated server for Minecraft Java Edition.

<a href="https://www.minecraft.net/"><img src="https://www.minecraft.net/content/dam/games/minecraft/key-art/MC_One-Vanilla_285x380px.jpg" alt="Minecraft logo" width="400"/></img></a>

## How to use this image
### Hosting a simple game server

Run the server using a bind mount for data persistence:

```console
$ mkdir -p $(pwd)/minecraft-data
$ chmod 777 $(pwd)/minecraft-data
$ docker run -d -p 25565:25565 \
    -v $(pwd)/minecraft-data:/app \
    -e EULA=TRUE \
    --name minecraft-server jcivitell/minecraft-server
```

**The container will automatically download and start the Minecraft server on startup.**

## Configuration
### Environment Variables
Feel free to overwrite these environment variables using -e (--env):

```dockerfile
EULA=FALSE                 (Set to TRUE to accept the Minecraft EULA)
MAX_PLAYERS=2              (Maximum number of players)
DIFFICULTY=easy            (World difficulty: easy, normal, hard)
GAMEMODE=survival          (Game mode: survival, creative, adventure, spectator)
MOTD="A Minecraft Server"  (Message of the Day)
ALLOW_FLIGHT=false         (Allow players to fly)
ALLOW_NETHER=true          (Allow access to the Nether)
RCON_PW=""                 (RCON password, if empty RCON is disabled)
```

## Additional Information
- The server runs on Java 21 (OpenJDK).
- The server.jar is downloaded from the official Mojang server.
- The server listens on port 25565 (TCP/UDP).
- Server data is stored in the /app directory within the container.

## Credits
This Docker image is maintained by [jcivitel](https://github.com/jcivitel/).

## Contributors
[![Contributors Display](https://badges.pufler.dev/contributors/jcivitel/minecraft-server?size=50&padding=5&bots=false)](https://github.com/jcivitel/minecraft-server/graphs/contributors)
