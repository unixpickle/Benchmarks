use std::env::args;

fn reverse_array(the_list: &mut Vec<usize>) {
  for i in 0..the_list.len() / 2 {
    let last_idx = the_list.len() - i - 1;
    the_list.swap(i, last_idx);
  }
}

fn main() {
  if args().count() != 3 {
    panic!("Usage: {} <size> <iterations>", args().next().unwrap());
  }

  let mut args_iter = args().skip(1);

  let count: usize = args_iter.next().unwrap().parse().unwrap();
  let iterations: usize = args_iter.next().unwrap().parse().unwrap();

  let mut array: Vec<usize> = (0..count).collect();

  for _ in 0..iterations {
   reverse_array(&mut array);
  }
}
