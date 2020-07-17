#!doc "Truly" random number generator. Distribution is approximately uniform for small numbers.
#!doc Maximum range size (upper - lower) is 2147483647.

#!param em math_in1 Lower bound
#!param em math_in2 Upper bound

#!return em math_out Random integer within the range [lower, upper)

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
scoreboard players operation math_out em %= math_in2 em
execute if score math_in2 em matches 0 run scoreboard players set math_out em 0
scoreboard players operation math_out em += math_in1 em
scoreboard players operation math_in2 em += math_in1 em
