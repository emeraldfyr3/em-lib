scoreboard players set result test_em 1

# 5! == 120
scoreboard players set math_in1 em 5
scoreboard players set expected test_em 120
scoreboard players set math_out 0
function em:math/factorial
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/factorial failed with input ", {"score": {"name": "math_in1", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# 12! == 479001600
scoreboard players set math_in1 em 5
scoreboard players set expected test_em 120
scoreboard players set math_out 0
function em:math/factorial
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/factorial failed with input ", {"score": {"name": "math_in1", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# 1! == 1
scoreboard players set math_in1 em 1
scoreboard players set expected test_em 1
scoreboard players set math_out 0
function em:math/factorial
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/factorial failed with input ", {"score": {"name": "math_in1", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# 0! == 1
scoreboard players set math_in1 em 0
scoreboard players set expected test_em 1
scoreboard players set math_out 0
function em:math/factorial
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/factorial failed with input ", {"score": {"name": "math_in1", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# (-3)! == 0
scoreboard players set math_in1 em -3
scoreboard players set expected test_em 0
scoreboard players set math_out -1
function em:math/factorial
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/factorial failed with input ", {"score": {"name": "math_in1", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]
