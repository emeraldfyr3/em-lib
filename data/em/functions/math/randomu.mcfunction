#!doc "Truly" random number generator with uniform distribution.
#!doc Maximum range size (upper - lower) is 2147483647.

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
