#!doc "Truly" random number generator. Distribution is approximately uniform for small numbers. "True" random means that the number is derived from Minecraft's randomness.
#!doc Maximum range size (upper - lower) is 2147483647.
#!doc For faster performance, use `em:math/randomp`. For a guaranteed uniform distribution but slower performance, use `em:math/randomu`.

#!video https://www.youtube.com/watch?v=LNFgu_qithk 3 Random Number Generator Functions for Minecraft Java 1.16

#!param math_in1 em Lower bound
#!param math_in2 em Upper bound

#!return math_out em Random integer within the range [lower, upper)

#!objective em

#!constant -2147483648 em

execute if predicate _em:1_2 run scoreboard players operation math_out em += #-2147483648 em
execute if predicate _em:1_2 run scoreboard players add math_out em 1073741824
execute if predicate _em:1_2 run scoreboard players add math_out em 536870912
execute if predicate _em:1_2 run scoreboard players add math_out em 268435456
execute if predicate _em:1_2 run scoreboard players add math_out em 134217728
execute if predicate _em:1_2 run scoreboard players add math_out em 67108864
execute if predicate _em:1_2 run scoreboard players add math_out em 33554432
execute if predicate _em:1_2 run scoreboard players add math_out em 16777216
execute if predicate _em:1_2 run scoreboard players add math_out em 8388608
execute if predicate _em:1_2 run scoreboard players add math_out em 4194304
execute if predicate _em:1_2 run scoreboard players add math_out em 2097152
execute if predicate _em:1_2 run scoreboard players add math_out em 1048576
execute if predicate _em:1_2 run scoreboard players add math_out em 524288
execute if predicate _em:1_2 run scoreboard players add math_out em 262144
execute if predicate _em:1_2 run scoreboard players add math_out em 131072
execute if predicate _em:1_2 run scoreboard players add math_out em 65536
execute if predicate _em:1_2 run scoreboard players add math_out em 32768
execute if predicate _em:1_2 run scoreboard players add math_out em 16384
execute if predicate _em:1_2 run scoreboard players add math_out em 8192
execute if predicate _em:1_2 run scoreboard players add math_out em 4096
execute if predicate _em:1_2 run scoreboard players add math_out em 2048
execute if predicate _em:1_2 run scoreboard players add math_out em 1024
execute if predicate _em:1_2 run scoreboard players add math_out em 512
execute if predicate _em:1_2 run scoreboard players add math_out em 256
execute if predicate _em:1_2 run scoreboard players add math_out em 128
execute if predicate _em:1_2 run scoreboard players add math_out em 64
execute if predicate _em:1_2 run scoreboard players add math_out em 32
execute if predicate _em:1_2 run scoreboard players add math_out em 16
execute if predicate _em:1_2 run scoreboard players add math_out em 8
execute if predicate _em:1_2 run scoreboard players add math_out em 4
execute if predicate _em:1_2 run scoreboard players add math_out em 2
execute if predicate _em:1_2 run scoreboard players add math_out em 1

scoreboard players operation math_in2 em -= math_in1 em
execute store result score math_out em run scoreboard players operation math_out em %= math_in2 em
scoreboard players operation math_out em += math_in1 em
scoreboard players operation math_in2 em += math_in1 em
