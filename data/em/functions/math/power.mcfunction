#!doc Raise a number to a power

#!param math_in1 em base
#!param math_in2 em exponent

#!return math_out em base to the power of exponent

#!video https://www.youtube.com/watch?v=gDObl5lCF1w Math Functions for Minecraft Java 1.16

#!objective em

#!constant 2 em

# #math__power__base = base, #math__power__exp1 = #math__power__exp2 = exponent, math_out = 1
scoreboard players operation #math__power__base em = math_in1 em
execute store result score #math__power__exp2 em store success score math_out em run scoreboard players operation #math__power__exp1 em = math_in2 em

# Special Case Base = -1: Exponent = Exponent % 2
execute if score math_in1 em matches -1 store result score #math__power__exp2 em run scoreboard players operation #math__power__exp1 em %= #2 em

# If exponent is negative, divide 1 by the base to get result.
# Dividing by 0 will fail the previous command, so store result in math_out to set it to 0 in that case.
# Store success in #math__power__base so that if this command is run, the base will be set to 1.
# This way the output is not changed by the power iteration.
execute if score #math__power__exp1 em matches ..-1 store result score math_out em store success score #math__power__base em run scoreboard players operation math_out em /= math_in1 em

# Iterative power function:
# If power is odd, multiply output by base and subtract 1 from power.
# If power is even, square base and divide power by 2.
# The max power without overflowing is 31, with a base of -2.
# Run it 7 times, the number of iterations for a power of 28
# Take a shortcut for the last couple iterations when the remaining power can only be 1 (from 29 or 30) or 2 (from 31).

scoreboard players operation #math__power__exp1 em /= #2 em
scoreboard players operation #math__power__exp2 em -= #math__power__exp1 em
execute if score #math__power__exp2 em > #math__power__exp1 em run scoreboard players operation math_out em *= #math__power__base em
execute if score #math__power__exp2 em = #math__power__exp1 em run scoreboard players operation #math__power__base em *= #math__power__base em
execute if score #math__power__exp2 em > #math__power__exp1 em store result score #math__power__exp2 em run scoreboard players operation #math__power__exp1 em += #math__power__exp1 em

scoreboard players operation #math__power__exp1 em /= #2 em
scoreboard players operation #math__power__exp2 em -= #math__power__exp1 em
execute if score #math__power__exp2 em > #math__power__exp1 em run scoreboard players operation math_out em *= #math__power__base em
execute if score #math__power__exp2 em = #math__power__exp1 em run scoreboard players operation #math__power__base em *= #math__power__base em
execute if score #math__power__exp2 em > #math__power__exp1 em store result score #math__power__exp2 em run scoreboard players operation #math__power__exp1 em += #math__power__exp1 em

scoreboard players operation #math__power__exp1 em /= #2 em
scoreboard players operation #math__power__exp2 em -= #math__power__exp1 em
execute if score #math__power__exp2 em > #math__power__exp1 em run scoreboard players operation math_out em *= #math__power__base em
execute if score #math__power__exp2 em = #math__power__exp1 em run scoreboard players operation #math__power__base em *= #math__power__base em
execute if score #math__power__exp2 em > #math__power__exp1 em store result score #math__power__exp2 em run scoreboard players operation #math__power__exp1 em += #math__power__exp1 em

scoreboard players operation #math__power__exp1 em /= #2 em
scoreboard players operation #math__power__exp2 em -= #math__power__exp1 em
execute if score #math__power__exp2 em > #math__power__exp1 em run scoreboard players operation math_out em *= #math__power__base em
execute if score #math__power__exp2 em = #math__power__exp1 em run scoreboard players operation #math__power__base em *= #math__power__base em
execute if score #math__power__exp2 em > #math__power__exp1 em store result score #math__power__exp2 em run scoreboard players operation #math__power__exp1 em += #math__power__exp1 em

scoreboard players operation #math__power__exp1 em /= #2 em
scoreboard players operation #math__power__exp2 em -= #math__power__exp1 em
execute if score #math__power__exp2 em > #math__power__exp1 em run scoreboard players operation math_out em *= #math__power__base em
execute if score #math__power__exp2 em = #math__power__exp1 em run scoreboard players operation #math__power__base em *= #math__power__base em
execute if score #math__power__exp2 em > #math__power__exp1 em store result score #math__power__exp2 em run scoreboard players operation #math__power__exp1 em += #math__power__exp1 em

scoreboard players operation #math__power__exp1 em /= #2 em
scoreboard players operation #math__power__exp2 em -= #math__power__exp1 em
execute if score #math__power__exp2 em > #math__power__exp1 em run scoreboard players operation math_out em *= #math__power__base em
execute if score #math__power__exp2 em = #math__power__exp1 em run scoreboard players operation #math__power__base em *= #math__power__base em
execute if score #math__power__exp2 em > #math__power__exp1 em store result score #math__power__exp2 em run scoreboard players operation #math__power__exp1 em += #math__power__exp1 em

scoreboard players operation #math__power__exp1 em /= #2 em
scoreboard players operation #math__power__exp2 em -= #math__power__exp1 em
execute if score #math__power__exp2 em > #math__power__exp1 em run scoreboard players operation math_out em *= #math__power__base em
execute if score #math__power__exp2 em = #math__power__exp1 em run scoreboard players operation #math__power__base em *= #math__power__base em
execute if score #math__power__exp2 em > #math__power__exp1 em store result score #math__power__exp2 em run scoreboard players operation #math__power__exp1 em += #math__power__exp1 em

# At this point, the most #math__power__exp1 could be without the output overflowing is 2
execute if score #math__power__exp1 em matches 1..2 run scoreboard players operation math_out em *= #math__power__base em
execute if score #math__power__exp1 em matches 2 run scoreboard players operation math_out em *= #math__power__base em
