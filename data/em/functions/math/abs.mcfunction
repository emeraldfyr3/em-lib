#!doc Get the absolute value of a number

#!param math_in1 em number

#!return math_out em absolute value of number

#!video https://www.youtube.com/watch?v=gDObl5lCF1w Math Functions for Minecraft Java 1.16

#!objective em

#!constant -1 em

scoreboard players operation math_out em = math_in1 em
execute if score math_out em matches ..-1 run scoreboard players operation math_out em *= #-1 em
