#include <stdio.h>
#include <stdlib.h>

unsigned int addUpTo(unsigned int dest) {
  unsigned int sum = 0;
  for (int i = 1; i <= dest; i++) {
    sum += i;
  }
  return sum;
}

double rollAverage(unsigned int dest) {
  double average = 0;
  for (unsigned int i = 0; i < dest; i++) {
    average = (average + (double)addUpTo(i)) / 2.0;
  }
  return average;
}

int main(int argc, const char ** argv) {
  if (argc != 3) {
    fprintf(stderr, "Usage: roll-avg <start> <end>\n");
    return 1;
  }
  int start = atoi(argv[1]);
  int end = atoi(argv[2]);
  for (int i = start; i <= end; i++) {
    printf("rollAverage(%d) = %lf\n", i, rollAverage(i));
  }
  return 0;
}
