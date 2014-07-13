import 'vector.dart';

class Particle {
  Vector position;
  double mass;
  Vector velocity;
  
  Particle(this.position, this.mass) {
    velocity = new Vector(0, 0);
  }
  
  Vector forceFrom(Particle p) {
    Vector distance = p.position - position;
    double magnitude = mass * p.mass / distance.dot(distance);
    return distance.normalize() * magnitude;
  }
  
  void applyForce(Vector force, double timeDelta) {
    velocity.addInPlace(force * (timeDelta / mass.abs()));
    position.addInPlace(velocity * timeDelta);
  }
  
  String toString() {
    return "{Particle mass:${mass} velocity: ${velocity}" +
      " position: ${position}}";
  }

}
