[em](../../em.md) > [math](../math.md) > randomu

# em:math/randomu

"Truly" random number generator with uniform distribution for all ranges. "True" random means that the number is derived from Minecraft's randomness.

Maximum range size (upper - lower) is 2147483647.

For faster performance, use `em:math/random`. For even faster performance, use `em:math/randomp`.

## Parameters

| Objective | Player/Selector | Comment     |
| --------- | --------------- | ----------- |
| em        | math_in1        | Lower bound |
| em        | math_in2        | Upper bound |

## Returns

| Objective | Player/Selector | Comment                                        |
| --------- | --------------- | ---------------------------------------------- |
| em        | math_out        | Random integer within the range [lower, upper) |
