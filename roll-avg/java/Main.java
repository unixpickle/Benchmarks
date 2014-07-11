class Main {

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

  public static void main(String[] args) {
    if (args.length != 2) {
      System.err.println("Usage: java Main <start> <end>");
      System.exit(1);
    }
    int start = Integer.parseInt(args[0]);
    int end = Integer.parseInt(args[1]);
    for (int i = start; i <= end; i++) {
      System.out.println("rollAverage(" + i + ") = " + rollAverage(i));
    }
  }

}