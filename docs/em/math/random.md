[em](../../em.md) > [math](../math.md) > random

# em:math/random

"Truly" random number generator. Distribution is approximately uniform for small numbers. "True" random means that the number is derived from Minecraft's randomness.

Maximum range size (upper - lower) is 2147483647.

For faster performance, use `em:math/randomp`. For a guaranteed uniform distribution but slower performance, use `em:math/randomu`.

## Parameters

| Objective | Player/Selector | Comment     |
| --------- | --------------- | ----------- |
| em        | math_in1        | Lower bound |
| em        | math_in2        | Upper bound |

## Returns

| Objective | Player/Selector | Comment                                        |
| --------- | --------------- | ---------------------------------------------- |
| em        | math_out        | Random integer within the range [lower, upper) |
