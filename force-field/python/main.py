from particle import Particle
from vector import Vector
import sys

if len(sys.argv) != 3:
  print('Usage: python main.py <time delta> <count>')
  exit(1)

timeDelta = float(sys.argv[1])
count = int(sys.argv[2])

p1 = Particle(Vector(0.3, 0), -1)
p2 = Particle(Vector(-0.3, 1), 1)

while count > 0:
  force1 = p1.forceFrom(p2)
  force2 = p2.forceFrom(p1)
  p1.applyForce(force1, timeDelta)
  p2.applyForce(force2, timeDelta)
  count -= 1

print("p1 = " + str(p1))
print("p2 = " + str(p2))
