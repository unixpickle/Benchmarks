use std::env::args;

fn main() {
    if args().count() != 3 {
        panic!("Usage: main <size> <iterations>");
    }

    let mut args_iter = args().skip(1);

    let count = args_iter.next().unwrap().parse::<usize>().unwrap();
    let iterations = args_iter.next().unwrap().parse::<usize>().unwrap();

    let mut array: Vec<usize> = (0..count).collect();

    for _ in 0..iterations {
        array.reverse();
    }
}
