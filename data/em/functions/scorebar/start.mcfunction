#!doc Start synchronizing score for player "scorebar" on objective "em" with bossbar "em:scorebar"

#!objective em

#!bossbar em:scorebar

execute store result score #scorebar em run bossbar get em:scorebar value
function _em:scorebar/sync
