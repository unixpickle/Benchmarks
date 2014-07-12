import 'dart:io';

int addUpTo(int dest) {
  int sum = 0;
  for (int i = 1; i <= dest; i++) {
    sum += i;
  }
  return sum;
}

double rollAverage(int dest) {
  double average = 0;
  for (int i = 0; i < dest; i++) {
    average = (average + addUpTo(i)) / 2.0;
  }
  return average;
}

main(List<String> arguments) {
  if (arguments.length != 2) {
    print("Usage: dart main.dart <start> <end>");
    exit(1);
  }
  int start = int.parse(arguments[0]);
  int end = int.parse(arguments[1]);
  for (int i = start; i <= end; i++) {
    print("rollAverage(" + i.toString() + ") = " + rollAverage(i).toString());
  }
}
