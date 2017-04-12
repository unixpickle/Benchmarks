mod particle;
mod vector;

use std::env::args;

use particle::Particle;
use vector::Vector;

fn main() {
  if args().count() != 3 {
    panic!("Usage: {} <time delta> <count>", args().next().unwrap());
  }

  let mut args_iter = args().skip(1);

  let time_delta: f64 = args_iter.next().unwrap().parse().unwrap();
  let count: usize = args_iter.next().unwrap().parse().unwrap();

  let mut p1 = Particle::new(Vector::from(0.3f64, 0f64), -1f64);
  let mut p2 = Particle::new(Vector::from(-0.3f64, 1f64), 1f64);

  for _ in 0..count {
    let force1 = p1.force_from(&p2);
    let force2 = p2.force_from(&p1);
    p1.apply_force(force1, time_delta);
    p2.apply_force(force2, time_delta);
  }

  println!("p1 = {}", p1);
  println!("p2 = {}", p2);
}
