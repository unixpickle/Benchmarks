use std::env::args;

fn reverse_array(the_list: &mut Vec<usize>) {
    for i in 0..the_list.len() >> 1 {
        let last_idx = the_list.len() - i - 1;
        let last_value = the_list[last_idx];
        the_list[last_idx] = the_list[i];
        the_list[i] = last_value;
    }
}

fn main() {
    if args().count() != 3 {
        panic!("Usage: main <size> <iterations>");
    }

    let mut args_iter = args().skip(1);

    let count = args_iter.next().unwrap().parse::<usize>().unwrap();
    let iterations = args_iter.next().unwrap().parse::<usize>().unwrap();

    let mut array: Vec<usize> = Vec::with_capacity(count);
    for i in 0..count {
        array.push(i);
    }

    for _ in 0..iterations {
        reverse_array(&mut array);
    }
}
