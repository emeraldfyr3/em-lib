[em](../../em.md) > [math](../math.md) > randomp

# em:math/randomp

> Source: [data/em/functions/math/randomp.mcfunction](../../../data/em/functions/math/randomp.mcfunction)

Pseudorandom number generator. Distribution is approximately uniform for small numbers.

Maximum range size (upper - lower) is 2147483647.

Credit to Cloud Wolf for initial LCG implementation

For "true" random numbers but slower performance, use `em:math/random`. For a guaranteed uniform distribution but even slower performance, use `em:math/randomu`.

## Parameters

Set these scoreboard values to pass in arguments to the function.

| Player/Selector | Objective | Description |
| --------------- | --------- | ----------- |
| math_in1        | em        | Lower bound |
| math_in2        | em        | Upper bound |

## Returns

The function's output will be saved to these scoreboard values.

| Player/Selector | Objective | Description                                    |
| --------------- | --------- | ---------------------------------------------- |
| math_out        | em        | Random integer within the range [lower, upper) |

## Video

### 3 Random Number Generator Functions for Minecraft Java 1.16

[![YouTube video for em:math/randomp](https://i3.ytimg.com/vi/LNFgu_qithk/maxresdefault.jpg)](https://www.youtube.com/watch?v=LNFgu_qithk)
