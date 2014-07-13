#ifndef __FORCE_FIELD_PARTICLE_HPP__
#define __FORCE_FIELD_PARTICLE_HPP__

#include "vector.hpp"

struct Particle {
  Vector position;
  double mass;
  Vector velocity;
  
  Particle(const Vector & pos, double _mass) : position(pos), mass(_mass) {}
  
  Particle() = delete;
  Particle(const Particle & p) = delete;
  Particle & operator=(const Particle & p) = delete;
  
  Vector ForceFrom(const Particle & p) {
    Vector distance = p.position - position;
    
    // G*m1*m1/d^2, assuming G=1
    double magnitude = mass * p.mass / distance.Dot(distance);
    
    return distance.Normalize() * magnitude;
  }
  
  void ApplyForce(Vector force, double timeDelta) {
    velocity += force * (timeDelta / fabs(mass));
    position += velocity * timeDelta;
  }
};

std::ostream & operator<<(std::ostream & stream, const Particle & v) {
  return stream << "{Particle mass: " << v.mass << " velocity: "
    << v.velocity << " position: " << v.position << "}";
}

#endif
