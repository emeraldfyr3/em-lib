##### GENERATED FILE -- DO NOT EDIT #####

scoreboard objectives add test_em dummy
scoreboard players set successes test_em 0
scoreboard players set failures test_em 0

scoreboard players set ran test_em 0
scoreboard players set result test_em 0
execute store success score ran test_em run function _em:test/math/root
execute if score result test_em matches 0 run scoreboard players add failures test_em 1
execute unless score result test_em matches 0 run scoreboard players add successes test_em 1

scoreboard players set ran test_em 0
scoreboard players set result test_em 0
execute store success score ran test_em run function _em:test/math/factorial
execute if score result test_em matches 0 run scoreboard players add failures test_em 1
execute unless score result test_em matches 0 run scoreboard players add successes test_em 1

scoreboard players set ran test_em 0
scoreboard players set result test_em 0
execute store success score ran test_em run function _em:test/math/log
execute if score result test_em matches 0 run scoreboard players add failures test_em 1
execute unless score result test_em matches 0 run scoreboard players add successes test_em 1

scoreboard players set ran test_em 0
scoreboard players set result test_em 0
execute store success score ran test_em run function _em:test/math/divide_round
execute if score result test_em matches 0 run scoreboard players add failures test_em 1
execute unless score result test_em matches 0 run scoreboard players add successes test_em 1

scoreboard players set ran test_em 0
scoreboard players set result test_em 0
execute store success score ran test_em run function _em:test/math/round
execute if score result test_em matches 0 run scoreboard players add failures test_em 1
execute unless score result test_em matches 0 run scoreboard players add successes test_em 1

scoreboard players set ran test_em 0
scoreboard players set result test_em 0
execute store success score ran test_em run function _em:test/math/sign
execute if score result test_em matches 0 run scoreboard players add failures test_em 1
execute unless score result test_em matches 0 run scoreboard players add successes test_em 1

scoreboard players set ran test_em 0
scoreboard players set result test_em 0
execute store success score ran test_em run function _em:test/math/abs
execute if score result test_em matches 0 run scoreboard players add failures test_em 1
execute unless score result test_em matches 0 run scoreboard players add successes test_em 1

scoreboard players set ran test_em 0
scoreboard players set result test_em 0
execute store success score ran test_em run function _em:test/math/power
execute if score result test_em matches 0 run scoreboard players add failures test_em 1
execute unless score result test_em matches 0 run scoreboard players add successes test_em 1

tellraw @s ["Tests completed with ", {"score": {"name": "successes", "objective": "test_em"}}, " success(es) and ", {"score": {"name": "failures", "objective": "test_em"}}, " failure(s)."]
