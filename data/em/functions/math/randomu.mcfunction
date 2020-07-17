#!doc "Truly" random number generator with uniform distribution.
#!doc Maximum range size (upper - lower) is 2147483647.

#!param em math_in1 Lower bound
#!param em math_in2 Upper bound

#!return em math_out Random integer within the range [lower, upper)

#!objective em
#!objective _em_obj1
#!objective _em_obj2
#!objective _em_obj3
#!objective _em_obj4
#!objective _em_obj5
#!objective _em_obj6
#!objective _em_obj7
#!objective _em_obj8
#!objective _em_obj9
#!objective _em_obj10
#!objective _em_obj11
#!objective _em_obj12
#!objective _em_obj13
#!objective _em_obj14
#!objective _em_obj15
#!objective _em_obj16
#!objective _em_obj17
#!objective _em_obj18
#!objective _em_obj19
#!objective _em_obj20
#!objective _em_obj21
#!objective _em_obj22
#!objective _em_obj23
#!objective _em_obj24
#!objective _em_obj25
#!objective _em_obj26
#!objective _em_obj27
#!objective _em_obj28
#!objective _em_obj29
#!objective _em_obj30
#!objective _em_obj31

scoreboard players operation #em_var1 em = math_in1 em
scoreboard players operation #em_var2 em = math_in2 em

execute unless entity @e[tag=em_randomu1] run summon minecraft:armor_stand ~ -20000000 ~ {Invisible:1,Marker:1,Tags:["em_randomu1"]}
execute as @e[tag=em_randomu1,limit=1] run function _em:math/randomu/setrange

function em:math/random

scoreboard players operation math_in1 em = #em_var1 em
scoreboard players operation math_in2 em = #em_var2 em
