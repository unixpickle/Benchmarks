# The test

This test uses object orientation to compute a discrete approximation of electrostatic (inverse square) repulsion. It creates two "particles" and continually computes the force vectors each one has on the other. It then applies these forces to the particles' velocities, and then it applies the velocities to the particles' positions.

The program takes two arguments: the discrete amount of time between each "frame" and the number of frames to approximate with.

This is the most involved of the benchmarks I've created so far. It primarily serves to test a language's object creation/destruction efficiency. It also serves to test floating point and vectorization optimizations of a language.

Because this is the most involved test, there are many slight differences between each implementation. For example, in some languages I was able to use operator overloading, while in others I needed to create regular methods to perform the equivalent operations. If you have any suggestions on how to make this test more fair, go ahead and leave a pull request demonstrating how your change affects the results.

**This benchmark serves two purposes which may conflict if you choose to rewrite it in a different language.** While this benchmark tests object creation/destruction performance, it also guages a language's ability to perform vector arithmetic. Thus, if you write your own implementation of this in a language that has native vector support, you may want to write a version with the native vector type, and a version with your own custom vector implementation. This way, one test will guage the performance of custom object management, while the other will show the language's vectorization optimizations.

# Results

For this test I found it appropriate to use C++ instead of C. In C++, I use stack allocation exclusively to avoid expensive allocations. I believe that this is fair because few languages explicitly support such a feature.

The times record how long it would take to run the program with a time delta of 0.0001 and a count of 50,000,000. Some results are scaled.

| Language   | Time (s) |
|------------|----------|
|C++ (-O2)   |1.892     |
|C++ (-O3)   |1.895     |
|Rust        |2.105     |
|Java        |2.469     |
|Go          |3.581     |
|C++ (-O1)   |5.290     |
|Dart        |5.844     |
|Swift       |7.675     |
|C++ (-O0)   |7.773     |
|C# (-O=all) |10.639    |
|C# (normal) |10.712    |
|JavaScript  |16.159    |
|Ruby        |300.4     |
|PHP         |557.2     |
|Python 2    |717.2     |
|Python 3    |880.7     |

Both Pythons were recorded with 500000 iterations and scaled up by a factor of 100. Ruby and PHP were recorded with 1000000 iterations and scaled up by a factor of 50.
