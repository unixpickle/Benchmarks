#include <stdio.h>
#include <stdlib.h>

void reverseArray(int * theList, int count) {
  for (int i = 0; i < count >> 1; i++) {
    int lastIdx = count - i - 1;
    int lastValue = theList[lastIdx];
    theList[lastIdx] = theList[i];
    theList[i] = lastValue;
  }
}

int main(int argc, const char * argv[]) {
  if (argc != 3) {
    fprintf(stderr, "Usage: array-reverse <size> <iterations>\n");
    return 1;
  }
  
  int count = atoi(argv[1]);
  int iterations = atoi(argv[2]);
  
  int * array = malloc(sizeof(int) * count);
  for (int i = 0; i < count; i++) {
    array[i] = i;
  }
  
  for (int i = 0; i < iterations; i++) {
    reverseArray(array, count);
  }
  
  free(array);
  return 0;
}