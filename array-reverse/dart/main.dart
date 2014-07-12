import 'dart:io';

reverseArray(List<int> list) {
  for (int i = 0; i < list.length >> 1; i++) {
    int lastIdx = list.length - i - 1;
    int lastValue = list[lastIdx];
    list[lastIdx] = list[i];
    list[i] = lastValue;
  }
}

main(List<String> arguments) {
  if (arguments.length != 2) {
    print("Usage: dart main.dart <size> <iterations>");
    exit(1);
  }
  
  int size = int.parse(arguments[0]);
  int iterations = int.parse(arguments[1]);
  
  List<int> theList = new List(size);
  for (int i = 0; i < size; i++) {
    theList[i] = i;
  }
  
  for (int i = 0; i < iterations; i++) {
    reverseArray(theList);
  }
}
