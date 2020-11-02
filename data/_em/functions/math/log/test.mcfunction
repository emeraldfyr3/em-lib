scoreboard players set result test_em 1

# log2(128) == 7
scoreboard players set math_in1 em 2
scoreboard players set math_in2 em 128
scoreboard players set expected test_em 7
scoreboard players set math_out 0
function em:math/log
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/log failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# log2(150) == 7
scoreboard players set math_in1 em 2
scoreboard players set math_in2 em 150
scoreboard players set expected test_em 7
scoreboard players set math_out 0
function em:math/log
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/log failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# log2(100) == 6
scoreboard players set math_in1 em 2
scoreboard players set math_in2 em 100
scoreboard players set expected test_em 6
scoreboard players set math_out 0
function em:math/log
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/log failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# log5(125) == 3
scoreboard players set math_in1 em 5
scoreboard players set math_in2 em 125
scoreboard players set expected test_em 3
scoreboard players set math_out 0
function em:math/log
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/log failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# log5(2) == 0
scoreboard players set math_in1 em 5
scoreboard players set math_in2 em 2
scoreboard players set expected test_em 0
scoreboard players set math_out -1
function em:math/log
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/log failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# log1(128) == 0
scoreboard players set math_in1 em 1
scoreboard players set math_in2 em 128
scoreboard players set expected test_em 0
scoreboard players set math_out -1
function em:math/log
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/log failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# log0(128) == 0
scoreboard players set math_in1 em 0
scoreboard players set math_in2 em 128
scoreboard players set expected test_em 0
scoreboard players set math_out -1
function em:math/log
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/log failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# log-2(128) == 0
scoreboard players set math_in1 em -2
scoreboard players set math_in2 em 128
scoreboard players set expected test_em 0
scoreboard players set math_out -1
function em:math/log
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/log failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]
