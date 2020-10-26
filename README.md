# em-lib

**emeraldfyr3's Standard Function Library**

## Download
Download the release for your Minecraft version here: https://github.com/emeraldfyr3/em-lib/releases

## Functions
- math
  - random: Generate a random integer in "math_out" on objective "em" between the scores in "math_in1" and "math_in2".
  - randomp: Like random, but faster. Uses its own pseudorandom number algorithm instead of Minecraft's randomness.
  - randomu: Like random, but with a completely uniform distribution. Performance is slower.
- scorebar: Synchronize a boss bar with a player score
  - start: Start syncing boss bar em:scorebar with player "scorebar" on ebjective "em". Copy whatever score you want to sync with the bar into that objective and it will update the bar automatically.
  - stop: Stop syncing the boss bar
- scoretp: Teleport to coordinates in scoreboard values
