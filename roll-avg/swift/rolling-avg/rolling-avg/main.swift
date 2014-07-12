//
//  main.swift
//  rolling-avg
//
//  Created by Alex Nichol on 7/10/14.
//  Copyright (c) 2014 Alex Nichol. All rights reserved.
//

import Foundation

func addUpTo(dest: Int) -> Int {
  var sum : Int = 0
  var i : Int = 1
  // note here that range based for loops are a LOT slower!
  while i <= dest {
    sum += i
    i++
  }
  return sum
}

func rollAverage(dest: Int) -> Double {
  var average : Double = 0
  // see note in addUpTo()
  var i : Int = 0
  while i < dest {
    average = (average + Double(addUpTo(i))) / 2.0
    i++
  }
  return average
}

if C_ARGC != 3 {
  println("Usage: ./rolling-avg <start> <end>")
  exit(1)
}

let start = String.fromCString(C_ARGV[1])!.toInt()!
let end = String.fromCString(C_ARGV[2])!.toInt()!

for i in start...end {
  println("rollAverage(\(i)) = \(rollAverage(Int(i)))")
}
