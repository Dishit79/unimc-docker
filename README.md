
# Universal Minecraft Docker (unimc)

A docker image to run any minecraft java server you want.



## Installation

To use unimc 

```yml
services:
  minecraft:
    image: ghcr.io/dishit79/unimc:latest
    container_name: minecraft-server
    user: 1000:1000
    stdin_open: true
    tty: true
    ports:
      - "25569:25569"
    volumes:
      - PATH-TO-MC-SERVER:/minecraft
```
