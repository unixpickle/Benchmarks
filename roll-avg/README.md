# The test

This program has a very inefficient subroutine to compute the sum of every integer up to a certain value (i.e. 1 + 2 + 3 + 4 + ... + n). Also included is a function which performs a makeshift average on the sums. Essentially, it averages 1 and 2, then averages that with (1 + 2 + 3), and then averages that with (1 + 2 + 3 + 4), etc. It does this up to a specified maximum. Thus, the (unoptimized) average method runs in O(n^2) time.

The program takes two arguments which are the start and end indexes. The program will call the rolling average function with each argument between and including these boundaries, printing the result each time.

If you choose to write your own version of this benchmark, refrain from simplifying methods by using builtins or algorithms to compute sums or averages. The point of this benchmark is to test the language's optimizer to see if *it*&ndash;and not you&ndash;is capable of doing such things.

# Results

You may notice that Swift, Rust, and C are both extremely fast compared to their competition. I wrote a note specifically explaining this [here](c/note.md). Tl;dr, it's because Clang/LLVM was able to realize it could use the summation formula; this makes the program compiled with Clang run in O(n) time rather than O(n^2) time.

Every result here is from running the programs with a range of 10,000 to 10,020 (inclusive).

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
