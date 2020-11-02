scoreboard players set result test_em 1

# round(11, 2) == 12
scoreboard players set math_in1 em 11
scoreboard players set math_in2 em 2
scoreboard players set expected test_em 12
scoreboard players set math_out 0
function em:math/round
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/round failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# round(11, 3) == 12
scoreboard players set math_in1 em 11
scoreboard players set math_in2 em 3
scoreboard players set expected test_em 12
scoreboard players set math_out 0
function em:math/round
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/round failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# round(10, 3) == 9
scoreboard players set math_in1 em 11
scoreboard players set math_in2 em 3
scoreboard players set expected test_em 12
scoreboard players set math_out 0
function em:math/round
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/round failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# round(11, 1) == 11
scoreboard players set math_in1 em 11
scoreboard players set math_in2 em 1
scoreboard players set expected test_em 11
scoreboard players set math_out 0
function em:math/round
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/round failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# round(11, 0) == 0
scoreboard players set math_in1 em 11
scoreboard players set math_in2 em 0
scoreboard players set expected test_em 0
scoreboard players set math_out -1
function em:math/round
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/round failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# round(3, 11) == 0
scoreboard players set math_in1 em 3
scoreboard players set math_in2 em 11
scoreboard players set expected test_em 0
scoreboard players set math_out -1
function em:math/round
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/round failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# round(8, 11) == 11
scoreboard players set math_in1 em 8
scoreboard players set math_in2 em 11
scoreboard players set expected test_em 11
scoreboard players set math_out 0
function em:math/round
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/round failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# round(6, 12) == 12
scoreboard players set math_in1 em 6
scoreboard players set math_in2 em 12
scoreboard players set expected test_em 12
scoreboard players set math_out 0
function em:math/round
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/round failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# round(-11, 2) == -10
scoreboard players set math_in1 em -11
scoreboard players set math_in2 em 2
scoreboard players set expected test_em -10
scoreboard players set math_out 0
function em:math/round
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/round failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# round(-11, 3) == -12
scoreboard players set math_in1 em -11
scoreboard players set math_in2 em 3
scoreboard players set expected test_em -12
scoreboard players set math_out 0
function em:math/round
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/round failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# round(11, -2) == 12
scoreboard players set math_in1 em 11
scoreboard players set math_in2 em -2
scoreboard players set expected test_em 12
scoreboard players set math_out 0
function em:math/round
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/round failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# round(11, -3) == 12
scoreboard players set math_in1 em 11
scoreboard players set math_in2 em -3
scoreboard players set expected test_em 12
scoreboard players set math_out 0
function em:math/round
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/round failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]
