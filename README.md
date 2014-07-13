# Benchmarks

These are some simple language benchmarks I am running on the following seven programming languages:

 * C - Apple LLVM version 5.0 (clang-500.2.79)
 * Dart - Dart VM version 1.5.3 (Thu Jul 3 02:27:23 2014) on "macos_x64"
 * Java - java version "1.6.0_65"
 * JavaScript - v8 (under node v0.10.29)
 * Python - both 3.3.0 and 2.7.5
 * Ruby - ruby 2.0.0p451 (2014-02-24 revision 45167)
 * Swift - Xcode6, preview 3, "Version 6.0 (6A254o)"

My goal is to compare the performance of different data types and operations in these languages. To do this, I am writing identical programs (as identical as they can get, anyway) in each of the 7 languages. I will include instructions with these programs on how to use them to test performance.

# Areas to Compare

### Loops

Some looping mechanisms are better than others. For instance, creating an array with 10000 consecutive integers and then iterating over them is *not* an efficient way to loop.

### Function calls

Function calls have overhead. In C with optimizations, this overhead is pretty low. However, in other languages like Python and Ruby, function calls may be rather expensive.

### Arithmetic

Arithmetic operations are (mostly) single CPU instructions. It is up to various languages to leverage this to perform to the best of the CPU's ability.

### Memory

Accessing elements in arrays and updating variables should both be speedy operations. Allocating memory in the form of object construction should also be efficient.

In a langauge like C++, it is sometimes possible to avoid dynamic memory allocation altogether in favor of stack allocation. On the other hand, a langauge like Java forces you to create objects using the `new` operator.
