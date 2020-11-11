[em](../../em.md) > [math](../math.md) > randomu

# em:math/randomu

> Source: [data/em/functions/math/randomu.mcfunction](../../../data/em/functions/math/randomu.mcfunction)

"Truly" random number generator with uniform distribution for all ranges. "True" random means that the number is derived from Minecraft's randomness.

Maximum range size (upper - lower) is 2147483647.

For faster performance, use `em:math/random`. For even faster performance, use `em:math/randomp`.

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

[![YouTube video for em:math/randomu](https://i3.ytimg.com/vi/LNFgu_qithk/maxresdefault.jpg)](https://www.youtube.com/watch?v=LNFgu_qithk)
