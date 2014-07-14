# PHP Array Complexity

I found the following results when running the PHP implementation of array-reverse:

|Array Size |100 reversals (s) |
|-----------|------------------|
|100        |0.108             |
|1000       |3.220             |
|2000       |12.415            |
|3000       |28.19             |
|4000       |57.72             |
|5000       |99.67             |
|6000       |151.6             |
|7000       |214.4             |
|8000       |286.9             |
|9000       |365.7             |
|10000      |482               |

Usually, reversing an array takes O(n) time, but this is clearly converging to either O(n^2) time or something even worse. Because PHP arrays are internally hash maps, I suspect that it's approaching O(n) for each array access and thus O(n^2) for the reverse call.

Thus, it is possible to claim that PHP is **infinitely worse** at this benchmark than every other langauge.
