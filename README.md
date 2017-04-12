# Benchmarks

These are some simple language benchmarks I am running on the following programming languages:

 * C/C++ - Apple LLVM version 5.0 (clang-500.2.79)
 * Dart VM version: 1.8.5 (Tue Jan 13 13:04:11 2015) on "macos_ia32"
 * Java - java version "1.7.0_71"
 * JavaScript - v8 (under node v0.10.29)
 * Python - both 3.3.0 and 2.7.5
 * Ruby - ruby 2.0.0p451 (2014-02-24 revision 45167)
 * Swift - Xcode Version 6.1.1 (6A2008a)
 * PHP - PHP 5.6.5 (cli)
 * Go - go version go1.4 darwin/amd64
 * C# - Mono JIT compiler version 3.12.0 + Mono C# compiler version 3.12.0.0
 * Rust - rustc 1.18.0-nightly (c58c928e6 2017-04-11)

These benchmarks compare performance characteristics of 10 different programming languages. Each benchmark includes a nearly identical implementation of the same program in each language. The pre-calculated statistics found in this repository were all collected on the same machine with a 2.6GHz Intel Core i7 with 1600 MHz DDR3 RAM. The first set of benchmarks were run under Mac OS X 10.9.3; the second were run under Mac OS X 10.10 (14A389).

# Results

Here is a recap of each of the three benchmarks I have done so far. You should really, really read the benchmark-specific README if you notice anything unusual.

[Force field benchmark](force-field)

| Language   | Time (s) |
|------------|----------|
|C++ (-O2)   |1.892     |
|C++ (-O3)   |1.895     |
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

[Array reverse benchmark](array-reverse)

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

*PHP is not listed in this table because it runs the array-reverse benchmark in O(n^2) complexity rather than O(n) complexity and is thus "infinitely" slower.*

[Rolling average benchmark](roll-avg)

| Language   | Time (s) |
|------------|----------|
|C (-O1)     |0.005     |
|C (-O2)     |0.005     |
|C (-O3)     |0.005     |
|Rust        |0.007     |
|Swift       |0.008     |
|Java        |0.463     |
|Go          |0.603     |
|C# (normal) |0.621     |
|C# (-O=all) |0.681     |
|Dart        |1.057     |
|JavaScript  |1.312     |
|C (-O0)     |2.763     |
|Ruby        |31.582    |
|PHP         |40.925    |
|Python 2    |71.550    |
|Python 3    |81.143    |

*In the rolling average README, you will see an explanation of why C and Swift are so much faster than the rest*

# Fairness

I tried very hard to make every implementation of each test close in structure. With that being said, some languages have features others don't, and I could have missed a feature along the way. If this is the case, go ahead and make a pull request or file an issue and explain why I tested a certain language unfairly.

None of these tests are the "best way" to do what they do. Instead, the tests are *designed* to be inefficient in order to get a significant result from various optimizers.

# Areas to Compare

### Loops

Some looping mechanisms are better than others. For instance, creating an array with 10000 consecutive integers and then iterating over them is *not* an efficient way to loop. But don't worry, in Python 2 I avoid using `range()` for large loops in favor of `xrange()`.

### Function calls

Function calls have overhead. In C with optimizations, this overhead is pretty low and sometimes even non-existant (with inlining). However, in other languages like Python and Ruby, function calls may be rather expensive.

### Arithmetic

Arithmetic operations are (mostly) single CPU instructions. It is up to various languages to leverage this to perform to the best of the CPU's ability.

### Memory access

Accessing elements in arrays and updating variables should both be speedy operations.

### Object creation

Allocating memory through object construction should be very fast. In a langauge like C++, it is sometimes possible to avoid dynamic memory allocation altogether in favor of stack allocation. On the other hand, a langauge like Java forces you to create objects using the `new` operator.
