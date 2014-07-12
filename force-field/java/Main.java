class Main {
  
  public static void main(String[] args) {
    if (args.length != 2) {
      System.err.println("Usage: java Main <time delta> <count>");
      System.exit(1);
    }
    
    double timeDelta = Double.parseDouble(args[0]);
    int count = Integer.parseInt(args[1]);
    
    Particle p1 = new Particle(new Vector(0.3, 0), -1);
    Particle p2 = new Particle(new Vector(-0.3, 1), 1);
    for (int i = 0; i < count; i++) {
      Vector force1 = p1.forceFrom(p2);
      Vector force2 = p2.forceFrom(p1);
      p1.applyForce(force1, timeDelta);
      p2.applyForce(force2, timeDelta);
    }
    
    System.out.println("p1 = " + p1);
    System.out.println("p2 = " + p2);
  }
  
}