package main

import (
	"fmt"
	"os"
	"strconv"
)

func addUpTo(dest uint32) uint32 {
	sum := uint32(0)
	for i := uint32(1); i <= dest; i++ {
		sum += i
	}
	return sum
}

func rollAverage(dest int) float64 {
	average := 0.0
	for i := uint32(0); i < uint32(dest); i++ {
		average = (average+float64(addUpTo(i))) / 2.0
	}
	return average
}

func main() {
	if len(os.Args) != 3 {
		fmt.Fprintln(os.Stderr, "Usage: roll-avg <start> <end>")
		os.Exit(1)
	}
	
	start, _ := strconv.Atoi(os.Args[1])
	end, _ := strconv.Atoi(os.Args[2])
	
	for i := start; i <= end; i++ {
		fmt.Printf("rollAverage(%d) = %f\n", i, rollAverage(i))
	}
}

