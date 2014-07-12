This is significantly faster than the other tests (except for the Swift one, which uses Clang as well and is thus equivalently optimized). This is because Clang provides Induction Variable Simplification. This means that this:

    unsigned int addUpTo(unsigned int dest) {
      unsigned int sum = 0;
      for (int i = 1; i <= dest; i++) {
        sum += i;
      }
      return sum;
    }

Gets turned into this:

    unsigned int addUpTo(unsigned int dest) {
      return (unsigned int)(((long)dest * (long)(dest + 1)) >> 1);
    }

This changes the program from O(n^2) to O(n).