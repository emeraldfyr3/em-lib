scoreboard players set result test_em 1

# abs(3) = 3
scoreboard players set math_in1 em 3
scoreboard players set expected test_em 3
scoreboard players set math_out 0
function em:math/abs
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/abs failed with input ", {"score": {"name": "math_in1", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# abs(0) = 0
scoreboard players set math_in1 em 0
scoreboard players set expected test_em 0
scoreboard players set math_out -1
function em:math/abs
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/abs failed with input ", {"score": {"name": "math_in1", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# abs(-2) = 2
scoreboard players set math_in1 em -2
scoreboard players set expected test_em 2
scoreboard players set math_out 0
function em:math/abs
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/abs failed with input ", {"score": {"name": "math_in1", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]
