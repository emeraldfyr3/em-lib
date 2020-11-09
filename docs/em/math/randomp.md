[em](../../em.md) > [math](../math.md) > randomp

# em:math/randomp

Pseudorandom number generator. Distribution is approximately uniform for small numbers.

Maximum range size (upper - lower) is 2147483647.

Credit to Cloud Wolf for initial LCG implementation

For "true" random numbers but slower performance, use `em:math/random`. For a guaranteed uniform distribution but even slower performance, use `em:math/randomu`.

## Parameters

| Objective | Player/Selector | Comment     |
| --------- | --------------- | ----------- |
| em        | math_in1        | Lower bound |
| em        | math_in2        | Upper bound |

## Returns

| Objective | Player/Selector | Comment                                        |
| --------- | --------------- | ---------------------------------------------- |
| em        | math_out        | Random integer within the range [lower, upper) |
