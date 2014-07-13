import 'dart:io';

import 'particle.dart';
import 'vector.dart';

void main(List<String> args) {
  if (args.length != 2) {
    print("Usage: dart main.dart <time delta> <count>");
    exit(1);
  }
  
  double timeDelta = double.parse(args[0]);
  int count = int.parse(args[1]);
  
  Particle p1 = new Particle(new Vector(0.3, 0), -1);
  Particle p2 = new Particle(new Vector(-0.3, 1), 1);
  for (int i = 0; i < count; i++) {
    Vector force1 = p1.forceFrom(p2);
    Vector force2 = p2.forceFrom(p1);
    p1.applyForce(force1, timeDelta);
    p2.applyForce(force2, timeDelta);
  }
  
  print("p1 = ${p1}");
  print("p2 = ${p2}");
}
