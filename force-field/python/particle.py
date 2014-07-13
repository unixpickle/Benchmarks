from vector import Vector

class Particle:
  def __init__(self, pos, mass):
    self.position = pos
    self.mass = mass
    self.velocity = Vector(0, 0)
  
  def forceFrom(self, p):
    distance = p.position.subtract(self.position)
    magnitude = self.mass * p.mass / distance.dot(distance)
    return distance.normalize().scale(magnitude)
  
  def applyForce(self, force, timeDelta):
    self.velocity.addInPlace(force.scale(timeDelta / abs(self.mass)))
    self.position.addInPlace(self.velocity.scale(timeDelta))
  
  def __str__(self):
    return ("{Particle mass: " + str(self.mass) + " velocity: " +
      str(self.velocity) + " position: " + str(self.position) + "}")
