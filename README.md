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

These benchmarks compare performance characteristics of 8 different programming languages. Each benchmark includes a close to identical implementation of the same program in each language. The pre-calculated statistics found in this repository were all collected on the same machine running Mac OS X 10.9.3 with a 2.6GHz Intel Core i7 with 1600 MHz DDR3 RAM.

# Results

Here is a recap of each of the three benchmarks I have done so far. You should really, really read the benchmark-specific README if you notice anything unusual.

[Force field benchmark](force-field)

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
|PHP         |572.9     |
|Python 2    |717.2     |
|Python 3    |880.7     |

[Array reverse benchmark](array-reverse)

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

*PHP is not listed in this table because it runs the array-reverse benchmark in O(n^2) complexity rather than O(n) complexity and is thus "infinitely" slower.*

[Rolling average benchmark](roll-avg)

| Language   | Time (s) |
|------------|----------|
|C (-O1)     |0.005     |
|C (-O2)     |0.005     |
|C (-O3)     |0.005     |
|Swift       |0.015     |
|Java        |0.498     |
|Dart        |1.028     |
|JavaScript  |1.312     |
|C (-O0)     |2.763     |
|Ruby        |31.582    |
|PHP         |40.175    |
|Python 3    |116.3     |
|Python 2    |132.7     |

*In the rolling average README, you will see an explanation of why C and Swift are so much faster than the rest*

# Fairness

I tried very hard to make every implementation of each test close in structure. With that being said, some languages have some features others don't, and I easily may have missed a feature I shouldn't have. If this is the case, go ahead and make a pull request or file an issue and explain why I tested a certain language unfairly.

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
