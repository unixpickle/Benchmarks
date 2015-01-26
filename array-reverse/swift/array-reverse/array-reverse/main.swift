//
//  main.swift
//  array-reverse
//
//  Created by Alex Nichol on 7/11/14.
//  Copyright (c) 2014 Alex Nichol. All rights reserved.
//

import Foundation

func reverseArray(inout theList: Array<Int>) {
  for i in 0...(theList.count >> 1) - 1 {
    let lastIdx = theList.count - i - 1
    let lastValue = theList[lastIdx]
    theList[lastIdx] = theList[i]
    theList[i] = lastValue
  }
}

if C_ARGC != 3 {
  println("Usage: ./array-reverse <size> <iterations>")
  exit(1)
}

let size = String.fromCString(C_ARGV[1])!.toInt()!
let iterations = String.fromCString(C_ARGV[2])!.toInt()!


var list = Array<Int>(count: size, repeatedValue: 0)
for i in 0...size - 1 {
  list[i] = i
}

for i in 0...iterations - 1 {
  reverseArray(&list)
}
