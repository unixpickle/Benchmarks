# The test

This test uses object orientation to compute a discrete approximation of electrostatic (inverse square) repulsion. It creates two "particles" and continually computes the force vectors each one has on the other. It then applies these forces to the particles' velocities, and then the velocities are applied to the particles' positions.

The program takes two arguments: the discrete amount of time between each "frame" and then number of frames to approximate with.

This is the most involved of the benchmarks I've created so far. It primarily serves to test a language's object creation/destruction efficiency. It also serves to test floating point and vectorization optimizations of a language.

Because this is the most involved test, there are many slight differences between each implementation. For example, in some languages I was able to use operator overloading, while in others I needed to create regular methods to perform the equivalent operations. If you have any suggestions on how to make this test more fair, go ahead and leave a pull request demonstrating how your change affects the results.

# Results

Note that for this test I found it appropriate to use C++ instead of C. In C++, I use stack allocation exclusively to avoid pricey allocations. I believe that this is fair to do because no other language (besides maybe Swift) technically supports such a feature.

Each time is how long it would take to run the program with a time delta of 0.0001 and a count of 50,000,000. Some results may be scaled.

| Language   | Time (s) |
|------------|----------|
|C++ (-O2)   |1.892     |
|C++ (-O3)   |1.895     |
|Java        |2.610     |
|C++ (-O1)   |5.290     |
|C++ (-O0)   |7.773     |
|Swift       |9.060     |
|JavaScript  |16.159    |
|Dart        |27.875    |
|Ruby        |300.4     |
|Python 2    |717.2     |
|Python 3    |880.7     |

Both Python versions were recorded with 500000 iterations and scaled up by a factor of 100. The Ruby versions was recorded with 1000000 iterations and scaled up by a factor of 50.
