#!objective em
#!objective _em_obj1
#!objective _em_obj2
#!objective _em_obj3
#!objective _em_obj4
#!objective _em_obj5
#!objective _em_obj6
#!objective _em_obj7
#!objective _em_obj8
#!objective _em_obj9
#!objective _em_obj10
#!objective _em_obj11
#!objective _em_obj12
#!objective _em_obj13
#!objective _em_obj14
#!objective _em_obj15
#!objective _em_obj16
#!objective _em_obj17
#!objective _em_obj18
#!objective _em_obj19
#!objective _em_obj20
#!objective _em_obj21
#!objective _em_obj22
#!objective _em_obj23
#!objective _em_obj24
#!objective _em_obj25
#!objective _em_obj26
#!objective _em_obj27
#!objective _em_obj28
#!objective _em_obj29
#!objective _em_obj30
#!objective _em_obj31

# Get the range as a binary number, with the score in each _em_objN being the Nth bit
scoreboard players operation @s _em_obj1 = math_in2 em
scoreboard players operation @s _em_obj1 -= math_in1 em

execute store success score @s _em_obj31 run scoreboard players remove @s[scores={_em_obj1=1073741824..}] _em_obj1 1073741824
execute store success score @s _em_obj30 run scoreboard players remove @s[scores={_em_obj1=536870912..}] _em_obj1 536870912
execute store success score @s _em_obj29 run scoreboard players remove @s[scores={_em_obj1=268435456..}] _em_obj1 268435456
execute store success score @s _em_obj28 run scoreboard players remove @s[scores={_em_obj1=134217728..}] _em_obj1 134217728
execute store success score @s _em_obj27 run scoreboard players remove @s[scores={_em_obj1=67108864..}] _em_obj1 67108864
execute store success score @s _em_obj26 run scoreboard players remove @s[scores={_em_obj1=33554432..}] _em_obj1 33554432
execute store success score @s _em_obj25 run scoreboard players remove @s[scores={_em_obj1=16777216..}] _em_obj1 16777216
execute store success score @s _em_obj24 run scoreboard players remove @s[scores={_em_obj1=8388608..}] _em_obj1 8388608
execute store success score @s _em_obj23 run scoreboard players remove @s[scores={_em_obj1=4194304..}] _em_obj1 4194304
execute store success score @s _em_obj22 run scoreboard players remove @s[scores={_em_obj1=2097152..}] _em_obj1 2097152
execute store success score @s _em_obj21 run scoreboard players remove @s[scores={_em_obj1=1048576..}] _em_obj1 1048576
execute store success score @s _em_obj20 run scoreboard players remove @s[scores={_em_obj1=524288..}] _em_obj1 524288
execute store success score @s _em_obj19 run scoreboard players remove @s[scores={_em_obj1=262144..}] _em_obj1 262144
execute store success score @s _em_obj18 run scoreboard players remove @s[scores={_em_obj1=131072..}] _em_obj1 131072
execute store success score @s _em_obj17 run scoreboard players remove @s[scores={_em_obj1=65536..}] _em_obj1 65536
execute store success score @s _em_obj16 run scoreboard players remove @s[scores={_em_obj1=32768..}] _em_obj1 32768
execute store success score @s _em_obj15 run scoreboard players remove @s[scores={_em_obj1=16384..}] _em_obj1 16384
execute store success score @s _em_obj14 run scoreboard players remove @s[scores={_em_obj1=8192..}] _em_obj1 8192
execute store success score @s _em_obj13 run scoreboard players remove @s[scores={_em_obj1=4096..}] _em_obj1 4096
execute store success score @s _em_obj12 run scoreboard players remove @s[scores={_em_obj1=2048..}] _em_obj1 2048
execute store success score @s _em_obj11 run scoreboard players remove @s[scores={_em_obj1=1024..}] _em_obj1 1024
execute store success score @s _em_obj10 run scoreboard players remove @s[scores={_em_obj1=512..}] _em_obj1 512
execute store success score @s _em_obj9 run scoreboard players remove @s[scores={_em_obj1=256..}] _em_obj1 256
execute store success score @s _em_obj8 run scoreboard players remove @s[scores={_em_obj1=128..}] _em_obj1 128
execute store success score @s _em_obj7 run scoreboard players remove @s[scores={_em_obj1=64..}] _em_obj1 64
execute store success score @s _em_obj6 run scoreboard players remove @s[scores={_em_obj1=32..}] _em_obj1 32
execute store success score @s _em_obj5 run scoreboard players remove @s[scores={_em_obj1=16..}] _em_obj1 16
execute store success score @s _em_obj4 run scoreboard players remove @s[scores={_em_obj1=8..}] _em_obj1 8
execute store success score @s _em_obj3 run scoreboard players remove @s[scores={_em_obj1=4..}] _em_obj1 4
execute store success score @s _em_obj2 run scoreboard players remove @s[scores={_em_obj1=2..}] _em_obj1 2

# Split the range into buckets of size 2^(b-1) based on its bits and use the weighted loot table to choose one
# Example, range size of 11 (binary 01011): 0-7 (bit 4, size 2^3), 8-9 (bit 2, size 2^1), 10 (bit 1, size 2^0)
loot replace entity @s weapon.mainhand loot _em:randomu
execute store result score #math__randomu__bucket em run data get entity @s HandItems[0].Count

# Shrink the range to the chosen bucket
execute if score @s _em_obj31 matches 1 if score #math__randomu__bucket em matches ..30 run scoreboard players add math_in1 em 1073741824
execute if score @s _em_obj30 matches 1 if score #math__randomu__bucket em matches ..29 run scoreboard players add math_in1 em 536870912
execute if score @s _em_obj29 matches 1 if score #math__randomu__bucket em matches ..28 run scoreboard players add math_in1 em 268435456
execute if score @s _em_obj28 matches 1 if score #math__randomu__bucket em matches ..27 run scoreboard players add math_in1 em 134217728
execute if score @s _em_obj27 matches 1 if score #math__randomu__bucket em matches ..26 run scoreboard players add math_in1 em 67108864
execute if score @s _em_obj26 matches 1 if score #math__randomu__bucket em matches ..25 run scoreboard players add math_in1 em 33554432
execute if score @s _em_obj25 matches 1 if score #math__randomu__bucket em matches ..24 run scoreboard players add math_in1 em 16777216
execute if score @s _em_obj24 matches 1 if score #math__randomu__bucket em matches ..23 run scoreboard players add math_in1 em 8388608
execute if score @s _em_obj23 matches 1 if score #math__randomu__bucket em matches ..22 run scoreboard players add math_in1 em 4194304
execute if score @s _em_obj22 matches 1 if score #math__randomu__bucket em matches ..21 run scoreboard players add math_in1 em 2097152
execute if score @s _em_obj21 matches 1 if score #math__randomu__bucket em matches ..20 run scoreboard players add math_in1 em 1048576
execute if score @s _em_obj20 matches 1 if score #math__randomu__bucket em matches ..19 run scoreboard players add math_in1 em 524288
execute if score @s _em_obj19 matches 1 if score #math__randomu__bucket em matches ..18 run scoreboard players add math_in1 em 262144
execute if score @s _em_obj18 matches 1 if score #math__randomu__bucket em matches ..17 run scoreboard players add math_in1 em 131072
execute if score @s _em_obj17 matches 1 if score #math__randomu__bucket em matches ..16 run scoreboard players add math_in1 em 65536
execute if score @s _em_obj16 matches 1 if score #math__randomu__bucket em matches ..15 run scoreboard players add math_in1 em 32768
execute if score @s _em_obj15 matches 1 if score #math__randomu__bucket em matches ..14 run scoreboard players add math_in1 em 16384
execute if score @s _em_obj14 matches 1 if score #math__randomu__bucket em matches ..13 run scoreboard players add math_in1 em 8192
execute if score @s _em_obj13 matches 1 if score #math__randomu__bucket em matches ..12 run scoreboard players add math_in1 em 4096
execute if score @s _em_obj12 matches 1 if score #math__randomu__bucket em matches ..11 run scoreboard players add math_in1 em 2048
execute if score @s _em_obj11 matches 1 if score #math__randomu__bucket em matches ..10 run scoreboard players add math_in1 em 1024
execute if score @s _em_obj10 matches 1 if score #math__randomu__bucket em matches ..9 run scoreboard players add math_in1 em 512
execute if score @s _em_obj9 matches 1 if score #math__randomu__bucket em matches ..8 run scoreboard players add math_in1 em 256
execute if score @s _em_obj8 matches 1 if score #math__randomu__bucket em matches ..7 run scoreboard players add math_in1 em 128
execute if score @s _em_obj7 matches 1 if score #math__randomu__bucket em matches ..6 run scoreboard players add math_in1 em 64
execute if score @s _em_obj6 matches 1 if score #math__randomu__bucket em matches ..5 run scoreboard players add math_in1 em 32
execute if score @s _em_obj5 matches 1 if score #math__randomu__bucket em matches ..4 run scoreboard players add math_in1 em 16
execute if score @s _em_obj4 matches 1 if score #math__randomu__bucket em matches ..3 run scoreboard players add math_in1 em 8
execute if score @s _em_obj3 matches 1 if score #math__randomu__bucket em matches ..2 run scoreboard players add math_in1 em 4
execute if score @s _em_obj2 matches 1 if score #math__randomu__bucket em matches ..1 run scoreboard players add math_in1 em 2

execute if score @s _em_obj1 matches 1 if score #math__randomu__bucket em matches 2.. run scoreboard players remove math_in2 em 1
execute if score @s _em_obj2 matches 1 if score #math__randomu__bucket em matches 3.. run scoreboard players remove math_in2 em 2
execute if score @s _em_obj3 matches 1 if score #math__randomu__bucket em matches 4.. run scoreboard players remove math_in2 em 4
execute if score @s _em_obj4 matches 1 if score #math__randomu__bucket em matches 5.. run scoreboard players remove math_in2 em 8
execute if score @s _em_obj5 matches 1 if score #math__randomu__bucket em matches 6.. run scoreboard players remove math_in2 em 16
execute if score @s _em_obj6 matches 1 if score #math__randomu__bucket em matches 7.. run scoreboard players remove math_in2 em 32
execute if score @s _em_obj7 matches 1 if score #math__randomu__bucket em matches 8.. run scoreboard players remove math_in2 em 64
execute if score @s _em_obj8 matches 1 if score #math__randomu__bucket em matches 9.. run scoreboard players remove math_in2 em 128
execute if score @s _em_obj9 matches 1 if score #math__randomu__bucket em matches 10.. run scoreboard players remove math_in2 em 256
execute if score @s _em_obj10 matches 1 if score #math__randomu__bucket em matches 11.. run scoreboard players remove math_in2 em 512
execute if score @s _em_obj11 matches 1 if score #math__randomu__bucket em matches 12.. run scoreboard players remove math_in2 em 1024
execute if score @s _em_obj12 matches 1 if score #math__randomu__bucket em matches 13.. run scoreboard players remove math_in2 em 2048
execute if score @s _em_obj13 matches 1 if score #math__randomu__bucket em matches 14.. run scoreboard players remove math_in2 em 4096
execute if score @s _em_obj14 matches 1 if score #math__randomu__bucket em matches 15.. run scoreboard players remove math_in2 em 8192
execute if score @s _em_obj15 matches 1 if score #math__randomu__bucket em matches 16.. run scoreboard players remove math_in2 em 16384
execute if score @s _em_obj16 matches 1 if score #math__randomu__bucket em matches 17.. run scoreboard players remove math_in2 em 32768
execute if score @s _em_obj17 matches 1 if score #math__randomu__bucket em matches 18.. run scoreboard players remove math_in2 em 65536
execute if score @s _em_obj18 matches 1 if score #math__randomu__bucket em matches 19.. run scoreboard players remove math_in2 em 131072
execute if score @s _em_obj19 matches 1 if score #math__randomu__bucket em matches 20.. run scoreboard players remove math_in2 em 262144
execute if score @s _em_obj20 matches 1 if score #math__randomu__bucket em matches 21.. run scoreboard players remove math_in2 em 524288
execute if score @s _em_obj21 matches 1 if score #math__randomu__bucket em matches 22.. run scoreboard players remove math_in2 em 1048576
execute if score @s _em_obj22 matches 1 if score #math__randomu__bucket em matches 23.. run scoreboard players remove math_in2 em 2097152
execute if score @s _em_obj23 matches 1 if score #math__randomu__bucket em matches 24.. run scoreboard players remove math_in2 em 4194304
execute if score @s _em_obj24 matches 1 if score #math__randomu__bucket em matches 25.. run scoreboard players remove math_in2 em 8388608
execute if score @s _em_obj25 matches 1 if score #math__randomu__bucket em matches 26.. run scoreboard players remove math_in2 em 16777216
execute if score @s _em_obj26 matches 1 if score #math__randomu__bucket em matches 27.. run scoreboard players remove math_in2 em 33554432
execute if score @s _em_obj27 matches 1 if score #math__randomu__bucket em matches 28.. run scoreboard players remove math_in2 em 67108864
execute if score @s _em_obj28 matches 1 if score #math__randomu__bucket em matches 29.. run scoreboard players remove math_in2 em 134217728
execute if score @s _em_obj29 matches 1 if score #math__randomu__bucket em matches 30.. run scoreboard players remove math_in2 em 268435456
execute if score @s _em_obj30 matches 1 if score #math__randomu__bucket em matches 31.. run scoreboard players remove math_in2 em 536870912
