#include <iostream>
#include <cstdlib>
#include "particle.hpp"
#include "vector.hpp"

using namespace std;

int main(int argc, const char * argv[]) {
  if (argc != 3) {
    cerr << "Usage: " << argv[0] << " <time delta> <count>" << endl;
    return 1;
  }
  
  double timeDelta = atof(argv[1]);
  int count = atoi(argv[2]);
  
  Particle p1(Vector(0.3, 0), -1);
  Particle p2(Vector(-0.3, 1), 1);
  for (int i = 0; i < count; i++) {
    Vector force1 = p1.ForceFrom(p2);
    Vector force2 = p2.ForceFrom(p1);
    p1.ApplyForce(force1, timeDelta);
    p2.ApplyForce(force2, timeDelta);
  }
  
  cout << "p1 = " << p1 << endl;
  cout << "p2 = " << p2 << endl;
  
  return 0;
}
