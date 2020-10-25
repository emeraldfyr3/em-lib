#!objective em

execute unless score scorebar em = #scorebar em run function _em:scorebar/update
schedule function _em:scorebar/sync 4
