#!doc Find the logarithm of a number in the given base

#!param math_in1 em base
#!param math_in2 em number

#!return math_out em logarithm of number in base

#!video https://www.youtube.com/watch?v=gDObl5lCF1w Math Functions for Minecraft Java 1.16

#!objective em

execute store result score #math__log__var em run scoreboard players set math_out em 0

# Only do for bases > 1; leave all else as output = 0
execute if score math_in1 em matches 2.. run scoreboard players operation #math__log__var1 em = math_in2 em

# Divide number by base up to 30 times, because that is the maximum possible value: log_2(2^30) = 30
# (31-bit positive integers in Minecraft, so 2^31 - 1 is the max value)
execute if score #math__log__var1 em matches 1.. run scoreboard players operation #math__log__var1 em /= math_in1 em
execute if score #math__log__var1 em matches 1.. run scoreboard players add math_out em 1
execute if score #math__log__var1 em matches 1.. run scoreboard players operation #math__log__var1 em /= math_in1 em
execute if score #math__log__var1 em matches 1.. run scoreboard players add math_out em 1
execute if score #math__log__var1 em matches 1.. run scoreboard players operation #math__log__var1 em /= math_in1 em
execute if score #math__log__var1 em matches 1.. run scoreboard players add math_out em 1
execute if score #math__log__var1 em matches 1.. run scoreboard players operation #math__log__var1 em /= math_in1 em
execute if score #math__log__var1 em matches 1.. run scoreboard players add math_out em 1
execute if score #math__log__var1 em matches 1.. run scoreboard players operation #math__log__var1 em /= math_in1 em
execute if score #math__log__var1 em matches 1.. run scoreboard players add math_out em 1
execute if score #math__log__var1 em matches 1.. run scoreboard players operation #math__log__var1 em /= math_in1 em
execute if score #math__log__var1 em matches 1.. run scoreboard players add math_out em 1
execute if score #math__log__var1 em matches 1.. run scoreboard players operation #math__log__var1 em /= math_in1 em
execute if score #math__log__var1 em matches 1.. run scoreboard players add math_out em 1
execute if score #math__log__var1 em matches 1.. run scoreboard players operation #math__log__var1 em /= math_in1 em
execute if score #math__log__var1 em matches 1.. run scoreboard players add math_out em 1
execute if score #math__log__var1 em matches 1.. run scoreboard players operation #math__log__var1 em /= math_in1 em
execute if score #math__log__var1 em matches 1.. run scoreboard players add math_out em 1
execute if score #math__log__var1 em matches 1.. run scoreboard players operation #math__log__var1 em /= math_in1 em
execute if score #math__log__var1 em matches 1.. run scoreboard players add math_out em 1
execute if score #math__log__var1 em matches 1.. run scoreboard players operation #math__log__var1 em /= math_in1 em
execute if score #math__log__var1 em matches 1.. run scoreboard players add math_out em 1
execute if score #math__log__var1 em matches 1.. run scoreboard players operation #math__log__var1 em /= math_in1 em
execute if score #math__log__var1 em matches 1.. run scoreboard players add math_out em 1
execute if score #math__log__var1 em matches 1.. run scoreboard players operation #math__log__var1 em /= math_in1 em
execute if score #math__log__var1 em matches 1.. run scoreboard players add math_out em 1
execute if score #math__log__var1 em matches 1.. run scoreboard players operation #math__log__var1 em /= math_in1 em
execute if score #math__log__var1 em matches 1.. run scoreboard players add math_out em 1
execute if score #math__log__var1 em matches 1.. run scoreboard players operation #math__log__var1 em /= math_in1 em
execute if score #math__log__var1 em matches 1.. run scoreboard players add math_out em 1
execute if score #math__log__var1 em matches 1.. run scoreboard players operation #math__log__var1 em /= math_in1 em
execute if score #math__log__var1 em matches 1.. run scoreboard players add math_out em 1
execute if score #math__log__var1 em matches 1.. run scoreboard players operation #math__log__var1 em /= math_in1 em
execute if score #math__log__var1 em matches 1.. run scoreboard players add math_out em 1
execute if score #math__log__var1 em matches 1.. run scoreboard players operation #math__log__var1 em /= math_in1 em
execute if score #math__log__var1 em matches 1.. run scoreboard players add math_out em 1
execute if score #math__log__var1 em matches 1.. run scoreboard players operation #math__log__var1 em /= math_in1 em
execute if score #math__log__var1 em matches 1.. run scoreboard players add math_out em 1
execute if score #math__log__var1 em matches 1.. run scoreboard players operation #math__log__var1 em /= math_in1 em
execute if score #math__log__var1 em matches 1.. run scoreboard players add math_out em 1
execute if score #math__log__var1 em matches 1.. run scoreboard players operation #math__log__var1 em /= math_in1 em
execute if score #math__log__var1 em matches 1.. run scoreboard players add math_out em 1
execute if score #math__log__var1 em matches 1.. run scoreboard players operation #math__log__var1 em /= math_in1 em
execute if score #math__log__var1 em matches 1.. run scoreboard players add math_out em 1
execute if score #math__log__var1 em matches 1.. run scoreboard players operation #math__log__var1 em /= math_in1 em
execute if score #math__log__var1 em matches 1.. run scoreboard players add math_out em 1
execute if score #math__log__var1 em matches 1.. run scoreboard players operation #math__log__var1 em /= math_in1 em
execute if score #math__log__var1 em matches 1.. run scoreboard players add math_out em 1
execute if score #math__log__var1 em matches 1.. run scoreboard players operation #math__log__var1 em /= math_in1 em
execute if score #math__log__var1 em matches 1.. run scoreboard players add math_out em 1
execute if score #math__log__var1 em matches 1.. run scoreboard players operation #math__log__var1 em /= math_in1 em
execute if score #math__log__var1 em matches 1.. run scoreboard players add math_out em 1
execute if score #math__log__var1 em matches 1.. run scoreboard players operation #math__log__var1 em /= math_in1 em
execute if score #math__log__var1 em matches 1.. run scoreboard players add math_out em 1
execute if score #math__log__var1 em matches 1.. run scoreboard players operation #math__log__var1 em /= math_in1 em
execute if score #math__log__var1 em matches 1.. run scoreboard players add math_out em 1
execute if score #math__log__var1 em matches 1.. run scoreboard players operation #math__log__var1 em /= math_in1 em
execute if score #math__log__var1 em matches 1.. run scoreboard players add math_out em 1
execute if score #math__log__var1 em matches 1.. run scoreboard players operation #math__log__var1 em /= math_in1 em
execute if score #math__log__var1 em matches 1.. run scoreboard players add math_out em 1
