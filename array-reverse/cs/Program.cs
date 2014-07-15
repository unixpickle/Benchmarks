using System;

namespace ArrayReverse {
  
  public class Program {
    
    public static void reverseArray(int[] array) {
      for (int i = 0; i < array.Length >> 1; i++) {
        int lastIdx = array.Length - i - 1;
        int lastValue = array[lastIdx];
        array[lastIdx] = array[i];
        array[i] = lastValue;
      }
    }
    
    public static void Main(string[] args) {
      if (args.Length != 2) {
        Console.Error.WriteLine("Usage: mono Program <size> <iterations>");
        Environment.Exit(1);
      }
      
      int[] myList = new int[Convert.ToInt32(args[0])];
      for (int i = 0; i < myList.Length; i++) {
        myList[i] = i;
      }
      int count = Convert.ToInt32(args[1]);
      for (int i = 0; i < count; i++) {
        reverseArray(myList);
      }
    }
  }  
}