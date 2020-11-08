[em](../../em.md) > [math](../math.md) > random

# em:math/random

"Truly" random number generator. Distribution is approximately uniform for small numbers.

Maximum range size (upper - lower) is 2147483647.

## Parameters

| Objective | Player/Selector | Comment     |
| --------- | --------------- | ----------- |
| em        | math_in1        | Lower bound |
| em        | math_in2        | Upper bound |

## Returns

| Objective | Player/Selector | Comment                                        |
| --------- | --------------- | ---------------------------------------------- |
| em        | math_out        | Random integer within the range [lower, upper) |
