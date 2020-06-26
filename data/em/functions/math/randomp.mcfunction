#!doc Pseudorandom number generator. Distribution is approximately uniform for small numbers.
#!doc Credit: CloudWolf

#!param em math_in1 Lower bound
#!param em math_in2 Upper bound

#!return em math_out Random integer within the range [lower, upper]

#!objective em

#!constant 1103515245 em

# LCG Seed Implementation
# x = x * a + c
# a = 1103515245, c = 12345

scoreboard players operation #randomp em *= #1103515245 em
scoreboard players add #randomp em 12345
scoreboard players operation math_out em = #randomp em

scoreboard players operation math_in2 em -= math_in1 em
scoreboard players operation math_out %= math_in2 em
scoreboard players operation math_out em += math_in1 em
scoreboard players operation math_in2 em += math_in1 em
