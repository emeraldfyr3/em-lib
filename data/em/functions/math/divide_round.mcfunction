#!doc Divide two numbers and round the result to the nearest integer

#!param em math_in1 dividend
#!param em math_in2 divisor

#!return em math_out rounded quotient

#!objective em

# round(n / d) = floor(n / d + 0.5) = floor(n / d + 1 / 2) = floor((2n + d) / (2d))
execute store result score #math__divide_round__divisor em run scoreboard players operation math_out em = math_in2 em
scoreboard players operation #math__divide_round__divisor em += math_in2 em
scoreboard players operation math_out em += math_in1 em
scoreboard players operation math_out em += math_in1 em
scoreboard players operation math_out em /= #math__divide_round__divisor em