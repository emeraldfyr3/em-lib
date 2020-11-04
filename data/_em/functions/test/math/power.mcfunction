scoreboard players set result test_em 1

# 2^7 == 128
scoreboard players set math_in1 em 2
scoreboard players set math_in2 em 7
scoreboard players set expected test_em 128
scoreboard players set math_out 0
function em:math/power
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/power failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# 2^30 == 1073741824
scoreboard players set math_in1 em -2
scoreboard players set math_in2 em 31
scoreboard players set expected test_em -2147483648
scoreboard players set math_out 0
function em:math/power
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/power failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# 5^3 == 125
scoreboard players set math_in1 em 5
scoreboard players set math_in2 em 3
scoreboard players set expected test_em 125
scoreboard players set math_out 0
function em:math/power
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/power failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# 6^1 == 6
scoreboard players set math_in1 em 6
scoreboard players set math_in2 em 1
scoreboard players set expected test_em 6
scoreboard players set math_out 0
function em:math/power
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/power failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# 9^0 == 1
scoreboard players set math_in1 em 9
scoreboard players set math_in2 em 0
scoreboard players set expected test_em 1
scoreboard players set math_out 0
function em:math/power
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/power failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# 4^-2 == 0
scoreboard players set math_in1 em 4
scoreboard players set math_in2 em -2
scoreboard players set expected test_em 0
scoreboard players set math_out -1
function em:math/power
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/power failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# (-2)^7 == -128
scoreboard players set math_in1 em -2
scoreboard players set math_in2 em 7
scoreboard players set expected test_em -128
scoreboard players set math_out 0
function em:math/power
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/power failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# (-2)^6 == 64
scoreboard players set math_in1 em -2
scoreboard players set math_in2 em 6
scoreboard players set expected test_em 64
scoreboard players set math_out 0
function em:math/power
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/power failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# (-2)^31 == -2147483648
scoreboard players set math_in1 em -2
scoreboard players set math_in2 em 31
scoreboard players set expected test_em -2147483648
scoreboard players set math_out 0
function em:math/power
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/power failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# (-2)^0 == 1
scoreboard players set math_in1 em -2
scoreboard players set math_in2 em 0
scoreboard players set expected test_em 1
scoreboard players set math_out 0
function em:math/power
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/power failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# (-2)^-1 == -1
scoreboard players set math_in1 em -2
scoreboard players set math_in2 em -1
scoreboard players set expected test_em -1
scoreboard players set math_out 0
function em:math/power
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/power failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# (-5)^-4 == -1
scoreboard players set math_in1 em -5
scoreboard players set math_in2 em -4
scoreboard players set expected test_em -1
scoreboard players set math_out 0
function em:math/power
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/power failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# 1^99 == 1
scoreboard players set math_in1 em 1
scoreboard players set math_in2 em 99
scoreboard players set expected test_em 1
scoreboard players set math_out 0
function em:math/power
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/power failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# 0^99 == 0
scoreboard players set math_in1 em 0
scoreboard players set math_in2 em 99
scoreboard players set expected test_em 0
scoreboard players set math_out -1
function em:math/power
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/power failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# 0^0 == 1
scoreboard players set math_in1 em 0
scoreboard players set math_in2 em 0
scoreboard players set expected test_em 1
scoreboard players set math_out 0
function em:math/power
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/power failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# (-1)^99 == -1
scoreboard players set math_in1 em -1
scoreboard players set math_in2 em 99
scoreboard players set expected test_em -1
scoreboard players set math_out 0
function em:math/power
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/power failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# (-1)^1000 == 1
scoreboard players set math_in1 em -1
scoreboard players set math_in2 em 1000
scoreboard players set expected test_em 1
scoreboard players set math_out 0
function em:math/power
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/power failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]

# (-1)^0 == 1
scoreboard players set math_in1 em -1
scoreboard players set math_in2 em 0
scoreboard players set expected test_em 1
scoreboard players set math_out 0
function em:math/power
execute unless score math_out em = expected test_em run scoreboard players set result test_em 0
execute unless score math_out em = expected test_em run tellraw @s ["em:math/power failed with inputs ", {"score": {"name": "math_in1", "objective": "em"}}, " and ", {"score": {"name": "math_in2", "objective": "em"}}, ": expected ", {"score": {"name": "expected", "objective": "test_em"}}, ", observed ", {"score": {"name": "math_out", "objective": "em"}}]
