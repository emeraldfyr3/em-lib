#!doc Start syncing boss bar `em:scorebar` with player "scorebar" on ebjective "em". Copy whatever score you want to sync with the bar into that objective and it will update the bar automatically.
#!doc To stop syncing, run `em:scorebar/stop`.

#!video https://www.youtube.com/watch?v=eLpItPL35C4 Automatically Update Bossbar with Scoreboard - Minecraft Java 1.16

#!objective em

#!bossbar em:scorebar

execute store result score #scorebar em run bossbar get em:scorebar value
function _em:scorebar/sync
