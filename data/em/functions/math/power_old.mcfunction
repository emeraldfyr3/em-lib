#!doc Raise a number to a power

#!param em math_in1 base
#!param em math_in2 exponent

#!return em math_out base to the power of exponent

#!objective em

#!constant 2

scoreboard players operation #em_var1 em = math_in2 em

# Special Case Base = -1: Exponent = Exponent % 2
execute if score math_in1 em matches -1 run scoreboard players operation #em_var1 em %= #2 em

# Power Operation Start
scoreboard players set math_out em 1

# If exponent is negative, divide 1 by the base to get result.
# Dividing by 0 will fail the previous command, so store result in math_out to set it to 0 in that case.
execute if score #em_var1 em matches ..-1 store result score math_out em run scoreboard players operation math_out em /= math_in1 em

# Running these commands 31 times, because that's the maximum possible number of times before score overflows.
# At that point, consider the output undefined.
# Doing it this way instead of recursively avoids lag for large exponents.
execute if score #em_var1 em matches 1.. run scoreboard players operation math_out em *= math_in1 em
execute if score #em_var1 em matches 1.. run scoreboard players remove #em_var1 em 1
execute if score #em_var1 em matches 1.. run scoreboard players operation math_out em *= math_in1 em
execute if score #em_var1 em matches 1.. run scoreboard players remove #em_var1 em 1
execute if score #em_var1 em matches 1.. run scoreboard players operation math_out em *= math_in1 em
execute if score #em_var1 em matches 1.. run scoreboard players remove #em_var1 em 1
execute if score #em_var1 em matches 1.. run scoreboard players operation math_out em *= math_in1 em
execute if score #em_var1 em matches 1.. run scoreboard players remove #em_var1 em 1
execute if score #em_var1 em matches 1.. run scoreboard players operation math_out em *= math_in1 em
execute if score #em_var1 em matches 1.. run scoreboard players remove #em_var1 em 1
execute if score #em_var1 em matches 1.. run scoreboard players operation math_out em *= math_in1 em
execute if score #em_var1 em matches 1.. run scoreboard players remove #em_var1 em 1
execute if score #em_var1 em matches 1.. run scoreboard players operation math_out em *= math_in1 em
execute if score #em_var1 em matches 1.. run scoreboard players remove #em_var1 em 1
execute if score #em_var1 em matches 1.. run scoreboard players operation math_out em *= math_in1 em
execute if score #em_var1 em matches 1.. run scoreboard players remove #em_var1 em 1
execute if score #em_var1 em matches 1.. run scoreboard players operation math_out em *= math_in1 em
execute if score #em_var1 em matches 1.. run scoreboard players remove #em_var1 em 1
execute if score #em_var1 em matches 1.. run scoreboard players operation math_out em *= math_in1 em
execute if score #em_var1 em matches 1.. run scoreboard players remove #em_var1 em 1
execute if score #em_var1 em matches 1.. run scoreboard players operation math_out em *= math_in1 em
execute if score #em_var1 em matches 1.. run scoreboard players remove #em_var1 em 1
execute if score #em_var1 em matches 1.. run scoreboard players operation math_out em *= math_in1 em
execute if score #em_var1 em matches 1.. run scoreboard players remove #em_var1 em 1
execute if score #em_var1 em matches 1.. run scoreboard players operation math_out em *= math_in1 em
execute if score #em_var1 em matches 1.. run scoreboard players remove #em_var1 em 1
execute if score #em_var1 em matches 1.. run scoreboard players operation math_out em *= math_in1 em
execute if score #em_var1 em matches 1.. run scoreboard players remove #em_var1 em 1
execute if score #em_var1 em matches 1.. run scoreboard players operation math_out em *= math_in1 em
execute if score #em_var1 em matches 1.. run scoreboard players remove #em_var1 em 1
execute if score #em_var1 em matches 1.. run scoreboard players operation math_out em *= math_in1 em
execute if score #em_var1 em matches 1.. run scoreboard players remove #em_var1 em 1
execute if score #em_var1 em matches 1.. run scoreboard players operation math_out em *= math_in1 em
execute if score #em_var1 em matches 1.. run scoreboard players remove #em_var1 em 1
execute if score #em_var1 em matches 1.. run scoreboard players operation math_out em *= math_in1 em
execute if score #em_var1 em matches 1.. run scoreboard players remove #em_var1 em 1
execute if score #em_var1 em matches 1.. run scoreboard players operation math_out em *= math_in1 em
execute if score #em_var1 em matches 1.. run scoreboard players remove #em_var1 em 1
execute if score #em_var1 em matches 1.. run scoreboard players operation math_out em *= math_in1 em
execute if score #em_var1 em matches 1.. run scoreboard players remove #em_var1 em 1
execute if score #em_var1 em matches 1.. run scoreboard players operation math_out em *= math_in1 em
execute if score #em_var1 em matches 1.. run scoreboard players remove #em_var1 em 1
execute if score #em_var1 em matches 1.. run scoreboard players operation math_out em *= math_in1 em
execute if score #em_var1 em matches 1.. run scoreboard players remove #em_var1 em 1
execute if score #em_var1 em matches 1.. run scoreboard players operation math_out em *= math_in1 em
execute if score #em_var1 em matches 1.. run scoreboard players remove #em_var1 em 1
execute if score #em_var1 em matches 1.. run scoreboard players operation math_out em *= math_in1 em
execute if score #em_var1 em matches 1.. run scoreboard players remove #em_var1 em 1
execute if score #em_var1 em matches 1.. run scoreboard players operation math_out em *= math_in1 em
execute if score #em_var1 em matches 1.. run scoreboard players remove #em_var1 em 1
execute if score #em_var1 em matches 1.. run scoreboard players operation math_out em *= math_in1 em
execute if score #em_var1 em matches 1.. run scoreboard players remove #em_var1 em 1
execute if score #em_var1 em matches 1.. run scoreboard players operation math_out em *= math_in1 em
execute if score #em_var1 em matches 1.. run scoreboard players remove #em_var1 em 1
execute if score #em_var1 em matches 1.. run scoreboard players operation math_out em *= math_in1 em
execute if score #em_var1 em matches 1.. run scoreboard players remove #em_var1 em 1
execute if score #em_var1 em matches 1.. run scoreboard players operation math_out em *= math_in1 em
execute if score #em_var1 em matches 1.. run scoreboard players remove #em_var1 em 1
execute if score #em_var1 em matches 1.. run scoreboard players operation math_out em *= math_in1 em
execute if score #em_var1 em matches 1.. run scoreboard players remove #em_var1 em 1
execute if score #em_var1 em matches 1.. run scoreboard players operation math_out em *= math_in1 em
execute if score #em_var1 em matches 1.. run scoreboard players remove #em_var1 em 1
