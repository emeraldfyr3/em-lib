scoreboard players set result test_em 1

# 6 / 3 == 2
scoreboard players set math_in1 em 6
scoreboard players set math_in2 em 3
scoreboard players set expected test_em 2
scoreboard players set math_out 0
function em:math/divide_round
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/divide_round failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# 9 / 2 == 5
scoreboard players set math_in1 em 9
scoreboard players set math_in2 em 2
scoreboard players set expected test_em 5
scoreboard players set math_out 0
function em:math/divide_round
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/divide_round failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# 10 / 3 == 3
scoreboard players set math_in1 em 10
scoreboard players set math_in2 em 3
scoreboard players set expected test_em 3
scoreboard players set math_out 0
function em:math/divide_round
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/divide_round failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# 11 / 3 == 4
scoreboard players set math_in1 em 11
scoreboard players set math_in2 em 3
scoreboard players set expected test_em 4
scoreboard players set math_out 0
function em:math/divide_round
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/divide_round failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# -6 / 3 == -2
scoreboard players set math_in1 em -6
scoreboard players set math_in2 em 3
scoreboard players set expected test_em -2
scoreboard players set math_out 0
function em:math/divide_round
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/divide_round failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# -9 / 2 == -4
scoreboard players set math_in1 em -9
scoreboard players set math_in2 em 2
scoreboard players set expected test_em -4
scoreboard players set math_out 0
function em:math/divide_round
execute unless score math_out em matches -4 run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/divide_round failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# -10 / 3 == -3
scoreboard players set math_in1 em -10
scoreboard players set math_in2 em 3
scoreboard players set expected test_em -3
scoreboard players set math_out 0
function em:math/divide_round
execute unless score math_out em matches -3 run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/divide_round failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# -11 / 3 == -4
scoreboard players set math_in1 em -11
scoreboard players set math_in2 em 3
scoreboard players set expected test_em -4
scoreboard players set math_out 0
function em:math/divide_round
execute unless score math_out em matches -4 run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/divide_round failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]
