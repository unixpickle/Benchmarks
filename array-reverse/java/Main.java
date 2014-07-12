class Main {
  
  public static void reverseArray(int[] array) {
    for (int i = 0; i < array.length >> 1; i++) {
      int lastIdx = array.length - i - 1;
      int lastValue = array[lastIdx];
      array[lastIdx] = array[i];
      array[i] = lastValue;
    }
  }
  
  public static void main(String[] args) {
    if (args.length != 2) {
      System.err.println("Usage: java Main <size> <iterations>");
      System.exit(1);
    }
    
    int[] myList = new int[Integer.parseInt(args[0])];
    for (int i = 0; i < myList.length; i++) {
      myList[i] = i;
    }
    int count = Integer.parseInt(args[1]);
    for (int i = 0; i < count; i++) {
      reverseArray(myList);
    }
  }
  
}