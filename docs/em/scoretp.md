[em](../em.md) > scoretp

# em:scoretp

> Source: [data/em/functions/scoretp.mcfunction](../../data/em/functions/scoretp.mcfunction)

Teleport an entity to coordinates in scoreboard values. Set the values in the entity's score on objectives scoretp_x, scoretp_y, and scoretp_z, then execute `function em:scoretp` as the entity.

The coordinates are relative to where the command is positioned. That means if an entity is at x=100 and scoretp_x=5, running `/execute as @e run function em:scoretp` will teleport the entity to x=105.

To use the coordinates as absolute, use execute to position the command at 0,0,0. Example: `/execute positioned 0 0 0 run function em:scoretp`

## Parameters

Set these scoreboard values to pass in arguments to the function.

| Player/Selector | Objective | Description           |
| --------------- | --------- | --------------------- |
| @s              | scoretp_x | relative x coordinate |
| @s              | scoretp_y | relative y coordinate |
| @s              | scoretp_z | relative z coordinate |

## Video

### How to Teleport to Scoreboard Values (Minecraft 1.16)

[![YouTube video for em:scoretp](https://i3.ytimg.com/vi/OINJSgKWQpg/maxresdefault.jpg)](https://www.youtube.com/watch?v=OINJSgKWQpg)
