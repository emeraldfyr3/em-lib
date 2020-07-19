#!doc Pseudorandom number generator. Distribution is approximately uniform for small numbers.
#!doc Maximum range size (upper - lower) is 2147483647.
#!doc Credit to Cloud Wolf for initial LCG implementation

#!param em math_in1 Lower bound
#!param em math_in2 Upper bound

#!return em math_out Random integer within the range [lower, upper)

#!objective em

#!constant 32768 em
#!constant 65536 em
#!constant 1103515245 em
#!constant -2147483648 em

#!init _em:math/randomp/reseed

# LCG Seed Implementation
# x = x * a + c
# a = 1103515245, c = 12345

# Generate a number and copy to #em_var1
scoreboard players operation #randomp em *= #1103515245 em
execute store result score #em_var1 em run scoreboard players add #randomp em 12345

# Use the sign bit and upper 15 bits of the first generated number as the sign and lower 15 of the output
scoreboard players operation #em_var1 em /= #65536 em

# Generate another number and copy to math_out
scoreboard players operation #randomp em *= #1103515245 em
execute store result score math_out em run scoreboard players add #randomp em 12345

# Use the upper 16 bits of the second generated number as the upper 16 of the output
scoreboard players operation math_out em /= #32768 em
scoreboard players operation math_out em *= #32768 em

# Combine the two partial outputs, first making sure they have the same sign bit
execute if score #em_var1 em matches ..0 if score math_out em matches 0.. run scoreboard players operation math_out em += #-2147483648 em
execute if score #em_var1 em matches 0.. if score math_out em matches ..0 run scoreboard players operation math_out em += #-2147483648 em
scoreboard players operation math_out em += #em_var1 em

# Fit to range
scoreboard players operation math_in2 em -= math_in1 em
execute store result score math_out em run scoreboard players operation math_out em %= math_in2 em
scoreboard players operation math_out em += math_in1 em
scoreboard players operation math_in2 em += math_in1 em
