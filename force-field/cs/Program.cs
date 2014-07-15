using System;

namespace ForceField {

  public class Program {
    
    public static void Main(String[] args) {
      if (args.Length != 2) {
        Console.Error.WriteLine("Usage: mono Program.exe <time delta> <count>");
        Environment.Exit(1);
      }
      
      double timeDelta = Convert.ToDouble(args[0]);
      int count = Convert.ToInt32(args[1]);
      
      Particle p1 = new Particle(new Vector(0.3, 0), -1);
      Particle p2 = new Particle(new Vector(-0.3, 1), 1);
      for (int i = 0; i < count; i++) {
        Vector force1 = p1.forceFrom(p2);
        Vector force2 = p2.forceFrom(p1);
        p1.applyForce(force1, timeDelta);
        p2.applyForce(force2, timeDelta);
      }
      
      Console.WriteLine("p1 = " + p1);
      Console.WriteLine("p2 = " + p2);
    }
    
  }
}
