using System;

namespace RollAvg {

  class Program {
  
    public static int addUpTo(int dest) {
      int sum = 0;
      for (int i = 1; i <= dest; i++) {
        sum += i;
      }
      return sum;
    }
  
    public static double rollAverage(int dest) {
      double average = 0;
      for (int i = 0; i < dest; i++) {
        average = (average + (double)addUpTo(i)) / 2.0;
      }
      return average;
    }
  
    public static void Main(String[] args) {
      if (args.Length != 2) {
        Console.Error.WriteLine("Usage: mono Program.exe <start> <end>");
        Environment.Exit(1);
      }
      int start = Convert.ToInt32(args[0]);
      int end = Convert.ToInt32(args[1]);
      for (int i = start; i <= end; i++) {
        Console.WriteLine("rollAverage(" + i + ") = " + rollAverage(i));
      }
    }
  
  }
  
}
