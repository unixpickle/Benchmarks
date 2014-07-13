class Particle {
  
  public Vector position;
  public double mass;
  public Vector velocity;
  
  public Particle(Vector pos, double _mass) {
    position = pos;
    mass = _mass;
    velocity = new Vector();
  }
  
  public Vector forceFrom(Particle p) {
    Vector distance = p.position.subtract(position);
    double magnitude = mass * p.mass / (distance.dot(distance));
    return distance.normalize().scale(magnitude);
  }
  
  public void applyForce(Vector force, double timeDelta) {
    velocity.addInPlace(force.scale(timeDelta / Math.abs(mass)));
    position.addInPlace(velocity.scale(timeDelta));
  }
  
  public String toString() {
    return "{Particle mass: " + mass + " velocity: " + velocity +
      " position: " + position + "}";
  }
  
}