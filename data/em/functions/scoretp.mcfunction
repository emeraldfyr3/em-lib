tp @s ~ ~ ~

execute if score @s scoretp_x matches 1.. run function _em:scoretp/x
execute if score @s scoretp_x matches ..-1 run function _em:scoretp/nx
execute if score @s scoretp_y matches 1.. run function _em:scoretp/y
execute if score @s scoretp_y matches ..-1 run function _em:scoretp/ny
execute if score @s scoretp_z matches 1.. run function _em:scoretp/z
execute if score @s scoretp_z matches ..-1 run function _em:scoretp/nz

# If the chunk is not already loaded, load it quickly for non-player entities.
execute at @s store success score #em_var1 scoretp_x run forceload query ~ ~
execute unless score #em_var1 scoretp_x matches 1 at @s[type=!minecraft:player] run forceload add ~ ~
execute unless score #em_var1 scoretp_x matches 1 at @s[type=!minecraft:player] run forceload remove ~ ~
