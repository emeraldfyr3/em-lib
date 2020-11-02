scoreboard players set result test_em 1

# 2√9 == 3
scoreboard players set math_in1 em 2
scoreboard players set math_in2 em 9
scoreboard players set expected test_em 3
scoreboard players set math_out 0
function em:math/root
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/root failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# 3√64 == 4
scoreboard players set math_in1 em 3
scoreboard players set math_in2 em 64
scoreboard players set expected test_em 4
scoreboard players set math_out 0
function em:math/root
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/root failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# 5√7776 == 6
scoreboard players set math_in1 em 5
scoreboard players set math_in2 em 7776
scoreboard players set expected test_em 6
scoreboard players set math_out 0
function em:math/root
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/root failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# 30√1073741824 == 2
scoreboard players set math_in1 em 30
scoreboard players set math_in2 em 1073741824
scoreboard players set expected test_em 2
scoreboard players set math_out 0
function em:math/root
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/root failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# 99√0 == 0
scoreboard players set math_in1 em 99
scoreboard players set math_in2 em 0
scoreboard players set expected test_em 0
scoreboard players set math_out -1
function em:math/root
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/root failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# 99√1 == 1
scoreboard players set math_in1 em 99
scoreboard players set math_in2 em 1
scoreboard players set expected test_em 1
scoreboard players set math_out 0
function em:math/root
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/root failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# 1√999 == 999
scoreboard players set math_in1 em 1
scoreboard players set math_in2 em 999
scoreboard players set expected test_em 999
scoreboard players set math_out 0
function em:math/root
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/root failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# 3√-125 == -5
scoreboard players set math_in1 em 3
scoreboard players set math_in2 em -125
scoreboard players set expected test_em -5
scoreboard players set math_out 0
function em:math/root
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/root failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# 31√-2147483648 == -2
scoreboard players set math_in1 em 31
scoreboard players set math_in2 em -2147483648
scoreboard players set expected test_em -2
scoreboard players set math_out 0
function em:math/root
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/root failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]
