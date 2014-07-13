require './Vector.rb'

class Particle
  attr_accessor :position
  attr_accessor :mass
  attr_accessor :velocity
  
  def initialize(pos, mass)
    @position = pos
    @mass = mass
    @velocity = Vector.new 0, 0
  end
  
  def forceFrom(p)
    distance = p.position.subtract @position
    magnitude = @mass * p.mass / distance.dot(distance)
    return distance.normalize().scale magnitude
  end
  
  def applyForce(force, timeDelta)
    velocity.addInPlace force.scale (timeDelta / @mass.abs)
    position.addInPlace velocity.scale timeDelta
  end
  
  def to_s
    "{Particle mass: #{@mass} velocity: #{@velocity} position: #{@position}}"
  end
end
