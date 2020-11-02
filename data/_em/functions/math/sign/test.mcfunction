scoreboard players set result test_em 1

# sign(2) == 1
scoreboard players set math_in1 em 2
scoreboard players set expected test_em 1
scoreboard players set math_out 0
function em:math/sign
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/sign failed with input ", {"score": {"name": "math_in1", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# sign(0) == 0
scoreboard players set math_in1 em 0
scoreboard players set expected test_em 0
scoreboard players set math_out -1
function em:math/sign
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/sign failed with input ", {"score": {"name": "math_in1", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# sign(-3) == 11
scoreboard players set math_in1 em -3
scoreboard players set expected test_em -1
scoreboard players set math_out 0
function em:math/sign
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/sign failed with input ", {"score": {"name": "math_in1", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]
