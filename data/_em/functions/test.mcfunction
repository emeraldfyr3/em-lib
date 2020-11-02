scoreboard objectives add test_em dummy
scoreboard players set successes test_em 0
scoreboard players set failures test_em 0

scoreboard players set ran test_em 0
scoreboard players set result test_em 0
execute store success score ran test_em run function _em:math/abs/test
execute if score result test_em matches 0 run scoreboard players add failures test_em 1
execute unless score result test_em matches 0 run scoreboard players add successes test_em 1

scoreboard players set ran test_em 0
scoreboard players set result test_em 0
execute store success score ran test_em run function _em:math/divide_round/test
execute if score result test_em matches 0 run scoreboard players add failures test_em 1
execute unless score result test_em matches 0 run scoreboard players add successes test_em 1

scoreboard players set ran test_em 0
scoreboard players set result test_em 0
execute store success score ran test_em run function _em:math/factorial/test
execute if score result test_em matches 0 run scoreboard players add failures test_em 1
execute unless score result test_em matches 0 run scoreboard players add successes test_em 1

scoreboard players set ran test_em 0
scoreboard players set result test_em 0
execute store success score ran test_em run function _em:math/log/test
execute if score result test_em matches 0 run scoreboard players add failures test_em 1
execute unless score result test_em matches 0 run scoreboard players add successes test_em 1

scoreboard players set ran test_em 0
scoreboard players set result test_em 0
execute store success score ran test_em run function _em:math/power/test
execute if score result test_em matches 0 run scoreboard players add failures test_em 1
execute unless score result test_em matches 0 run scoreboard players add successes test_em 1

scoreboard players set ran test_em 0
scoreboard players set result test_em 0
execute store success score ran test_em run function _em:math/root/test
execute if score result test_em matches 0 run scoreboard players add failures test_em 1
execute unless score result test_em matches 0 run scoreboard players add successes test_em 1

scoreboard players set ran test_em 0
scoreboard players set result test_em 0
execute store success score ran test_em run function _em:math/round/test
execute if score result test_em matches 0 run scoreboard players add failures test_em 1
execute unless score result test_em matches 0 run scoreboard players add successes test_em 1

scoreboard players set ran test_em 0
scoreboard players set result test_em 0
execute store success score ran test_em run function _em:math/sign/test
execute if score result test_em matches 0 run scoreboard players add failures test_em 1
execute unless score result test_em matches 0 run scoreboard players add successes test_em 1

tellraw @s ["Tests completed with ", {"score": {"name": "successes", "objective": "test_em"}}, " success(es) and ", {"score": {"name": "failures", "objective": "test_em"}}, " failure(s)."]
