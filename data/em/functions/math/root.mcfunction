#!doc Find the nth root of a number using Newton's Method for root approximation
#!doc https://en.wikipedia.org/wiki/Newton%27s_method#Square_root

#!param math_in1 em root degree
#!param math_in2 em number

#!return math_out em nth root of number

#!objective em

#!constant -1 em

# Approximation function:
# x1 = x0 - (f(x0) - n) / f'(x0)
#    = x0 - (x0^r - n) / (r * x0^(r - 1))
#    = (x0^r * (r - 1) + n) / (r * x0^(r - 1))
# r = math_in1, n = math_in2

# Save inputs, taking the absolute value of n and saving sign
execute store result score #math__root__r_minus_1 em store success score #math__root__sign em run scoreboard players operation #math__root__r em = math_in1 em
execute if score math_in2 em matches ..-1 run scoreboard players set #math__root__sign em -1
execute store result score #math__root__n em run scoreboard players operation math_in2 em *= #math__root__sign em

# Initial estimate: r√n == n^(1/r) == 2^(log2(n) / r)
scoreboard players set math_in1 em 2
function em:math/log
execute store result score math_in2 em run scoreboard players operation math_out em /= #math__root__r em
function em:math/power

# Move root degree minus 1 to exponent for power function
execute store result score math_in2 em run scoreboard players remove #math__root__r_minus_1 em 1

# Stop after converging
scoreboard players set #math__root__done em 0

# math_in1 = x0
execute store result score #math__root__x0 em run scoreboard players operation math_in1 em = math_out em

# math_out = x0^(r - 1)
function em:math/power
# math_in1 = x0^r
scoreboard players operation math_in1 em *= math_out em
# math_in1 = x0^r * (r - 1)
scoreboard players operation math_in1 em *= math_in2 em
# math_in1 = x0^r * (r - 1) + n
scoreboard players operation math_in1 em += #math__root__n em
# math_out = r * x0^(r - 1)
scoreboard players operation math_out em *= #math__root__r em
# math_in1 = x1 = (x0^r * (r - 1) + n) / (r * x0^(r - 1))
scoreboard players operation math_in1 em /= math_out em
# Check for convergence
execute if score #math__root__x0 em = math_in1 em run scoreboard players set #math__root__done em 1
scoreboard players operation #math__root__x0 em = math_in1 em

execute if score #math__root__done em matches 0 run function em:math/power
execute if score #math__root__done em matches 0 run scoreboard players operation math_in1 em *= math_out em
execute if score #math__root__done em matches 0 run scoreboard players operation math_in1 em *= math_in2 em
execute if score #math__root__done em matches 0 run scoreboard players operation math_in1 em += #math__root__n em
execute if score #math__root__done em matches 0 run scoreboard players operation math_out em *= #math__root__r em
execute if score #math__root__done em matches 0 run scoreboard players operation math_in1 em /= math_out em
execute if score #math__root__x0 em = math_in1 em run scoreboard players set #math__root__done em 1
scoreboard players operation #math__root__x0 em = math_in1 em

execute if score #math__root__done em matches 0 run function em:math/power
execute if score #math__root__done em matches 0 run scoreboard players operation math_in1 em *= math_out em
execute if score #math__root__done em matches 0 run scoreboard players operation math_in1 em *= math_in2 em
execute if score #math__root__done em matches 0 run scoreboard players operation math_in1 em += #math__root__n em
execute if score #math__root__done em matches 0 run scoreboard players operation math_out em *= #math__root__r em
execute if score #math__root__done em matches 0 run scoreboard players operation math_in1 em /= math_out em
execute if score #math__root__x0 em = math_in1 em run scoreboard players set #math__root__done em 1
scoreboard players operation #math__root__x0 em = math_in1 em

execute if score #math__root__done em matches 0 run function em:math/power
execute if score #math__root__done em matches 0 run scoreboard players operation math_in1 em *= math_out em
execute if score #math__root__done em matches 0 run scoreboard players operation math_in1 em *= math_in2 em
execute if score #math__root__done em matches 0 run scoreboard players operation math_in1 em += #math__root__n em
execute if score #math__root__done em matches 0 run scoreboard players operation math_out em *= #math__root__r em
execute if score #math__root__done em matches 0 run scoreboard players operation math_in1 em /= math_out em
execute if score #math__root__x0 em = math_in1 em run scoreboard players set #math__root__done em 1
scoreboard players operation #math__root__x0 em = math_in1 em

execute if score #math__root__done em matches 0 run function em:math/power
execute if score #math__root__done em matches 0 run scoreboard players operation math_in1 em *= math_out em
execute if score #math__root__done em matches 0 run scoreboard players operation math_in1 em *= math_in2 em
execute if score #math__root__done em matches 0 run scoreboard players operation math_in1 em += #math__root__n em
execute if score #math__root__done em matches 0 run scoreboard players operation math_out em *= #math__root__r em
execute if score #math__root__done em matches 0 run scoreboard players operation math_in1 em /= math_out em
execute if score #math__root__x0 em = math_in1 em run scoreboard players set #math__root__done em 1
scoreboard players operation #math__root__x0 em = math_in1 em

execute if score #math__root__done em matches 0 run function em:math/power
execute if score #math__root__done em matches 0 run scoreboard players operation math_in1 em *= math_out em
execute if score #math__root__done em matches 0 run scoreboard players operation math_in1 em *= math_in2 em
execute if score #math__root__done em matches 0 run scoreboard players operation math_in1 em += #math__root__n em
execute if score #math__root__done em matches 0 run scoreboard players operation math_out em *= #math__root__r em
execute if score #math__root__done em matches 0 run scoreboard players operation math_in1 em /= math_out em
execute if score #math__root__x0 em = math_in1 em run scoreboard players set #math__root__done em 1
scoreboard players operation #math__root__x0 em = math_in1 em

# Copy to output and correct the sign
execute store result score math_out em run scoreboard players operation math_in1 em *= #math__root__sign em

# Restore inputs
scoreboard players operation math_in1 em = #math__root__r em
execute store result score math_in2 em run scoreboard players operation #math__root__n em *= #math__root__sign em
