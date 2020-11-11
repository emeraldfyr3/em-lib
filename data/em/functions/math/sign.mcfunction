#!doc Get the sign of a number

#!param math_in1 em number

#!return math_out em sign: -1 if number is negative, 0 if number is 0, 1 if number is positive

#!objective em

execute if score math_in1 em matches ..-1 run scoreboard players set math_out em -1
execute if score math_in1 em matches 0 run scoreboard players set math_out em 0
execute if score math_in1 em matches 1.. run scoreboard players set math_out em 1
