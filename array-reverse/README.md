# The test

This program takes two arguments: the size of an array, and the number of times to reverse it. It creates the array as a sequential list of integers, and then calls a `reverseArray` method in a loop.

This test shows how close a language's array performance comes to raw memory performance. Additionally, it requires a tight loop and many function calls.

**The true purpose of this test isn't to see how fast a language can reverse an array.** The test is to see how efficient a langauge's array access/write times are. However, I understand that many languages include a builtin method for reversing an array. You should feel free to write two tests, one with this method and one without it. This way, you can also test your language's direct ability to reverse an array.

The creation of the array is *not* particularly on display, so you may use a builtin to create it (i.e. Python's `range()`). This is because the time to create the array is insignificant compared to the numerous iterations of the `reverseArray()` call.

# Results

These results all use a list of 100,000 elements. Some results will be scaled (since the Python and Ruby tests take too long otherwise). The end measurement is how long it took (or *would* take) to reverse the array 100,000 times.

| Language   | Time (s) |
|------------|----------|
|Java        |3.776     |
|C (-O3)     |4.273     |
|C (-O2)     |4.367     |
|C (-O1)     |4.395     |
|Rust        |5.698     |
|Go          |7.825     |
|C# (-O=all) |8.378     |
|Dart        |8.988     |
|JavaScript  |13.162    |
|C# (normal) |14.071    |
|C (-O0)     |17.034    |
|Swift       |25.658    |
|Ruby        |1439      |
|Python 3    |1466      |
|Python 2    |1485      |

For the tests up to and including *Swift* I used the full 100,000 iterations. For Ruby and both Pythons, I used 500 iterations and scaled up by 200.

I do not include PHP here because I discovered that PHP's array does not appear to operate in O(1) time like in other languages. See my [note](php/note.md)

# Results with builtins

These results use each language's "builtin" reverse method. Interestingly, JavaScript's Array.reverse() is actually slower than reversing the array manually in this case. The rest of the reverse builtins are inline with the optimized C performance.

| Language  | Time (s) |
|-----------|----------|
|Python 2   |4.520     |
|Python 3   |4.558     |
|Ruby       |4.591     |
|Rust       |5.565     |
|JavaScript |27.748    |
|PHP        |765.8     |

The PHP benchmark was run using 1000 iterations and scaling by 100.
