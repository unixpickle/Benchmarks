# The test

This program takes two arguments: the size of an array, and the number of times to reverse it. It creates the array as a sequential list of integers, and then calls a `reverseArray` method the specified number of times.

This test shows how close a language's array performance comes to actual pointer performance. Additionally, it requires a tight loop and many function calls.

# Results

These results are all using a list of 100,000 elements. Some results will be scaled (since the Python and Ruby tests take too long otherwise). The end measurement is how long it took to reverse the array 100,000 times.

| Language   | Time (s) |
|------------|----------|
|Java        |3.776     |
|C (-O3)     |4.273     |
|C (-O2)     |4.367     |
|C (-O1)     |4.395     |
|Dart        |10.485    |
|JavaScript  |13.162    |
|C (-O0)     |17.034    |
|Swift       |112.5     |
|Ruby        |1439      |
|Python 3    |1466      |
|Python 2    |1485      |

For the tests up to and including *C (-O0)* I used the full 100,000 iterations. For Swift, I did 10,000 iterations and scaled up by a factor of 10. For Ruby and both Pythons, I used 500 iterations and scaled up by 200.
