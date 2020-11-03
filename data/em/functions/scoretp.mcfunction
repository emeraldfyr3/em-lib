#!doc Teleport an entity to coordinates in scoreboard values.
#!doc The coordinates are relative to where the command is positioned.
#!doc To use the coordinates as absolute, position the command at 0,0,0.

#!param scoretp_x relative x coordinate
#!param scoretp_y relative y coordinate
#!param scoretp_z relative z coordinate

#!objective scoretp_x
#!objective scoretp_y
#!objective scoretp_z

tp @s ~ ~ ~

execute if score @s scoretp_x matches 1.. run function _em:scoretp/x
execute if score @s scoretp_x matches ..-1 run function _em:scoretp/nx
execute if score @s scoretp_y matches 1.. run function _em:scoretp/y
execute if score @s scoretp_y matches ..-1 run function _em:scoretp/ny
execute if score @s scoretp_z matches 1.. run function _em:scoretp/z
execute if score @s scoretp_z matches ..-1 run function _em:scoretp/nz

# If the chunk is not already loaded, load it quickly for non-player entities.
execute at @s store success score #scoretp__chunk_loaded scoretp_x run forceload query ~ ~
execute unless score #scoretp__chunk_loaded scoretp_x matches 1 at @s[type=!minecraft:player] run forceload add ~ ~
execute unless score #scoretp__chunk_loaded scoretp_x matches 1 at @s[type=!minecraft:player] run forceload remove ~ ~
