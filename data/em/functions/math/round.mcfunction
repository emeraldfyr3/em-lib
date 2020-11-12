#!doc Round a number to the nearest multiple of another number

#!param math_in1 em number to round
#!param math_in2 em factor

#!return math_out em rounded number

#!video https://www.youtube.com/watch?v=gDObl5lCF1w Math Functions for Minecraft Java 1.16

#!objective em

scoreboard players set #math__round__sign em 1
execute if score math_in2 em matches ..-1 run scoreboard players set #math__round__sign em -1
scoreboard players operation math_in2 em *= #math__round__sign em
function em:math/divide_round
scoreboard players operation math_out em *= math_in2 em
scoreboard players operation math_in2 em *= #math__round__sign em
