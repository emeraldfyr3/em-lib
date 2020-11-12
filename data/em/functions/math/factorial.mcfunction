#!doc Calculate the factorial of a number

#!param math_in1 em number

#!return math_out em factorial

#!video https://www.youtube.com/watch?v=gDObl5lCF1w Math Functions for Minecraft Java 1.16

#!objective em

# The max factorial before overflowing is 12!, so it's more efficient to pre-calculate all the answers than to do recursion.

# Undefined: Factorial of a negative number or number > 12 (overflow)
scoreboard players set math_out em 0

execute if score math_in1 em matches 0..1 run scoreboard players set math_out em 1
execute if score math_in1 em matches 2 run scoreboard players set math_out em 2
execute if score math_in1 em matches 3 run scoreboard players set math_out em 6
execute if score math_in1 em matches 4 run scoreboard players set math_out em 24
execute if score math_in1 em matches 5 run scoreboard players set math_out em 120
execute if score math_in1 em matches 6 run scoreboard players set math_out em 720
execute if score math_in1 em matches 7 run scoreboard players set math_out em 5040
execute if score math_in1 em matches 8 run scoreboard players set math_out em 40320
execute if score math_in1 em matches 9 run scoreboard players set math_out em 362880
execute if score math_in1 em matches 10 run scoreboard players set math_out em 3628800
execute if score math_in1 em matches 11 run scoreboard players set math_out em 39916800
execute if score math_in1 em matches 12 run scoreboard players set math_out em 479001600
