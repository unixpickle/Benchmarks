# The test

This program has a very inefficient subroutine to compute the sum of every integer up to a certain value (i.e. 1 + 2 + 3 + 4 + ... + n). Also included is a function which performs a makeshift average on the sums. Essentially, it averages 1 and 2, then averages that with (1 + 2 + 3), and then averages that with (1 + 2 + 3 + 4), etc. It does this up to a specified maximum. Thus, the (unoptimized) average method runs in O(n^2) time.

The program takes two arguments which are the start and end indexes. The program will call the rolling average function with each argument between and including these boundaries, printing the result each time.

# Results

You may notice that Swift and C are both extremely fast compared to their competition. I wrote a note specifically explaining this [here](c/note.md). Tl;dr, it's because Clang/LLVM was able to realize it could use the summation formula; this makes the program compiled with Clang run in O(n) time rather than O(n^2) time.

Every result here is from running the programs with a range of 10,000 to 10,020 (inclusive).

| Language   | Time (s) |
|------------|----------|
|C (-O1)     |0.005     |
|C (-O2)     |0.005     |
|C (-O3)     |0.005     |
|Swift       |0.015     |
|Java        |0.0498    |
|Dart        |1.028     |
|JavaScript  |1.312     |
|C (-O0)     |2.763     |
|Ruby        |31.582    |
|Python 2    |132.7     |
|Python 3    |116.3     |