package main

import (
	"fmt"
	"os"
	"strconv"
)

func reverseArray(l []int) {
	for i := 0; i < (len(l) >> 1); i++ {
		lastIdx := len(l) - i - 1
		l[lastIdx], l[i] = l[i], l[lastIdx]
	}
}

func main() {
	if len(os.Args) != 3 {
		fmt.Fprintln(os.Stderr, "Usage: array-reverse <size> <iterations>")
		os.Exit(1)
	}
	
	count, _ := strconv.Atoi(os.Args[1])
	iterations, _ := strconv.Atoi(os.Args[2])
	
	array := make([]int, count)
	for i := 0; i < count; i++ {
		array[i] = i
	}
	
	for i := 0; i < iterations; i++ {
		reverseArray(array)
	}
}
