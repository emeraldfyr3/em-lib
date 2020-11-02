#!doc Find the nth root of a number using Newton's Method for root approximation
#!doc https://en.wikipedia.org/wiki/Newton%27s_method#Square_root

#!param em math_in1 root degree
#!param em math_in2 number

#!return em math_out nth root of number

#!objective em

#!constant -1 em

# Approximation function:
# x1 = x0 - (x0^r - n) / (r * x0^(r - 1)), r = math_in1, n = math_in2
# x1 = (x0^r * (r - 1) + n) / (r * x0^(r - 1)), r = math_in1, n = math_in2

# Save inputs
execute store result score #math__root__r_minus_1 em run scoreboard players operation #math__root__r em = math_in1 em
scoreboard players operation #math__root__n em = math_in2 em

# Initial estimate: r√n == n^(1/r) == 2^(log2(n) / r)
scoreboard players set math_in1 em 2
execute if score #math__root__n em matches ..-1 run scoreboard players operation math_in2 em *= #-1 em
function em:math/log
execute store result score math_in2 em run scoreboard players operation math_out em /= #math__root__r em
function em:math/power
execute if score #math__root__n em matches ..-1 run scoreboard players operation math_out em *= #-1 em

# Move root degree minus 1 to exponent for power function
execute store result score math_in2 em run scoreboard players remove #math__root__r_minus_1 em 1

# math_in1 = x0
scoreboard players operation math_in1 em = math_out em

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

function em:math/power
scoreboard players operation math_in1 em *= math_out em
scoreboard players operation math_in1 em *= math_in2 em
scoreboard players operation math_in1 em += #math__root__n em
scoreboard players operation math_out em *= #math__root__r em
scoreboard players operation math_in1 em /= math_out em

function em:math/power
scoreboard players operation math_in1 em *= math_out em
scoreboard players operation math_in1 em *= math_in2 em
scoreboard players operation math_in1 em += #math__root__n em
scoreboard players operation math_out em *= #math__root__r em
scoreboard players operation math_in1 em /= math_out em

function em:math/power
scoreboard players operation math_in1 em *= math_out em
scoreboard players operation math_in1 em *= math_in2 em
scoreboard players operation math_in1 em += #math__root__n em
scoreboard players operation math_out em *= #math__root__r em
execute store result score math_out em run scoreboard players operation math_in1 em /= math_out em

# Restore inputs
scoreboard players operation math_in1 em = #math__root__r em
scoreboard players operation math_in2 em = #math__root__n em
