use std::fmt::{Display, Formatter, Result};

use super::vector::Vector;

pub struct Particle {
  pub position: Vector,
  pub mass: f64,
  velocity: Vector,
}

impl Particle {
  pub fn new(position: Vector, mass: f64) -> Particle {
    Particle {
      position: position,
      mass: mass,
      velocity: Vector::new(),
    }
  }

  pub fn force_from(&self, other: &Particle) -> Vector {
    let distance = other.position - self.position;

    // G*m1*m1/d^2, assuming G=1
    let magnitude = self.mass * other.mass / distance.dot(&distance);

    magnitude * distance.normalize()
  }

  pub fn apply_force(&mut self, force: Vector, time_delta: f64) {
    self.velocity += (time_delta / self.mass.abs()) * force;
    self.position += time_delta * self.velocity;
  }
}

impl Display for Particle {
  fn fmt(&self, f: &mut Formatter) -> Result {
    write!(
      f,
      "{{Particle mass: {} velocity: {} position: {}}}",
      self.mass,
      self.velocity,
      self.position
    )
  }
}
