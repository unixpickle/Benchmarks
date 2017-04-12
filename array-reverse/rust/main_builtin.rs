use std::env::args;

fn main() {
  if args().count() != 3 {
    panic!("Usage: {} <size> <iterations>", args().next().unwrap());
  }

  let mut args_iter = args().skip(1);

  let count: usize = args_iter.next().unwrap().parse().unwrap();
  let iterations: usize = args_iter.next().unwrap().parse().unwrap();

  let mut array: Vec<usize> = (0..count).collect();

  for _ in 0..iterations {
    array.reverse();
  }
}
