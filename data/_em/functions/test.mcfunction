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

execute if score successes test_em matches 1 if score failures test_em matches 1 run tellraw @s ["Tests completed with ", {"score": {"name": "successes", "objective": "test_em"}}, " success and ", {"score": {"name": "failures", "objective": "test_em"}}, " failure."]
execute if score successes test_em matches 1 unless score failures test_em matches 1 run tellraw @s ["Tests completed with ", {"score": {"name": "successes", "objective": "test_em"}}, " success and ", {"score": {"name": "failures", "objective": "test_em"}}, " failures."]
execute unless score successes test_em matches 1 if score failures test_em matches 1 run tellraw @s ["Tests completed with ", {"score": {"name": "successes", "objective": "test_em"}}, " successes and ", {"score": {"name": "failures", "objective": "test_em"}}, " failure."]
execute unless score successes test_em matches 1 unless score failures test_em matches 1 run tellraw @s ["Tests completed with ", {"score": {"name": "successes", "objective": "test_em"}}, " successes and ", {"score": {"name": "failures", "objective": "test_em"}}, " failures."]
