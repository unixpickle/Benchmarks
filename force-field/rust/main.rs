mod particle;
mod vector;

use std::env::args;

use particle::Particle;
use vector::Vector;

fn main() {
    if args().count() != 3 {
        panic!("Usage: ./main <time delta> <count>");
    }

    let mut args_iter = args().skip(1);

    let time_delta = args_iter.next().unwrap().parse::<f64>().unwrap();
    let count = args_iter.next().unwrap().parse::<usize>().unwrap();

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
