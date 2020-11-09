#!doc "Truly" random number generator with uniform distribution for all ranges. "True" random means that the number is derived from Minecraft's randomness.
#!doc Maximum range size (upper - lower) is 2147483647.
#!doc For faster performance, use `em:math/random`. For even faster performance, use `em:math/randomp`.

#!video https://www.youtube.com/watch?v=LNFgu_qithk 3 Random Number Generator Functions for Minecraft Java 1.16

#!param em math_in1 Lower bound
#!param em math_in2 Upper bound

#!return em math_out Random integer within the range [lower, upper)

#!objective em

scoreboard players operation #math__randomu__input1 em = math_in1 em
scoreboard players operation #math__randomu__input2 em = math_in2 em

execute unless entity @e[tag=em_randomu1] run summon minecraft:armor_stand ~ -20000000 ~ {Invisible:1,Marker:1,Tags:["em_randomu1"]}
execute as @e[tag=em_randomu1,limit=1] run function _em:math/randomu/setrange

function em:math/random

scoreboard players operation math_in1 em = #math__randomu__input1 em
scoreboard players operation math_in2 em = #math__randomu__input2 em
