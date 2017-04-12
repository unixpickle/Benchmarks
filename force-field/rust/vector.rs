use std::fmt::{Display, Formatter, Result};
use std::ops::{Add, AddAssign, Mul, Sub};

#[derive(Copy, Clone)]
pub struct Vector {
  pub x: f64,
  pub y: f64,
}

impl Vector {
  pub fn new() -> Vector {
    Vector {
      x: 0f64,
      y: 0f64,
    }
  }

  pub fn from(x: f64, y: f64) -> Vector {
    Vector {
      x: x,
      y: y,
    }
  }

  pub fn dot(&self, v: &Vector) -> f64 {
    self.x * v.x + self.y * v.y
  }

  pub fn normalize(&self) -> Vector {
    let magnitude = self.dot(&self).sqrt();

    if magnitude == 0f64 {
      return Vector::new();
    }

    (1f64 / magnitude) * *self
  }
}

impl Add for Vector {
  type Output = Vector;

  fn add(self, other: Vector) -> Vector {
    Vector::from(self.x + other.x, self.y + other.y)
  }
}

impl AddAssign for Vector {
  fn add_assign(&mut self, other: Vector) {
    *self = Vector {
      x: self.x + other.x,
      y: self.y + other.y,
    }
  }
}

impl Sub for Vector {
  type Output = Vector;

  fn sub(self, other: Vector) -> Vector {
    Vector::from(self.x - other.x, self.y - other.y)
  }
}

impl Mul<Vector> for f64 {
  type Output = Vector;

  fn mul(self, vector: Vector) -> Vector {
    Vector::from(vector.x * self, vector.y * self)
  }
}

impl Display for Vector {
  fn fmt(&self, f: &mut Formatter) -> Result {
    write!(f, "({}, {})", self.x, self.y)
  }
}
