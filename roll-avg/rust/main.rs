use std::env::args;

fn add_up_to(dest: usize) -> usize {
  let mut sum: usize = 0;

  for i in 1..dest + 1 {
    sum += i;
  }

  sum
}

fn roll_average(dest: usize) -> f64 {
  let mut average = 0f64;

  for i in 0..dest {
    average = (average + add_up_to(i) as f64) / 2f64;
  }

  average
}

fn main() {
  if args().count() != 3 {
    panic!("Usage: {} <start> <end>", args().next().unwrap());
  }

  let mut args_iter = args().skip(1);

  let start: usize = args_iter.next().unwrap().parse().unwrap();
  let end: usize = args_iter.next().unwrap().parse().unwrap();

  for i in start..end + 1 {
    println!("rollAverage({}) = {}", i, roll_average(i));
  }
}
