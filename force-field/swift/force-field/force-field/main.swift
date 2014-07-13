//
//  main.swift
//  force-field
//
//  Created by Alex Nichol on 7/12/14.
//  Copyright (c) 2014 Alex Nichol. All rights reserved.
//

import Foundation

if C_ARGC != 3 {
  println("Usage: ./force-field <time delay> <count>")
  exit(1);
}

let arg1 = String.fromCString(C_ARGV[1])!;
let timeDelta = NSString(string: arg1).doubleValue;
let count = String.fromCString(C_ARGV[2])!.toInt()!;

var p1 = Particle(position: Vector(x: 0.3, y: 0), mass: -1);
var p2 = Particle(position: Vector(x: -0.3, y: 1), mass: 1);

for i in 1...count {
  var force1 = p1.forceFrom(p2);
  var force2 = p2.forceFrom(p1);
  p1.applyForce(force1, timeDelta: timeDelta);
  p2.applyForce(force2, timeDelta: timeDelta);
}

println("p1 = \(p1)");
println("p2 = \(p2)");
