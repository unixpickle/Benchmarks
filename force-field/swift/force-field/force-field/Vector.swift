//
//  Vector.swift
//  force-field
//
//  Created by Alex Nichol on 7/12/14.
//  Copyright (c) 2014 Alex Nichol. All rights reserved.
//

import Foundation

struct Vector: Printable {
  var x: Double
  var y: Double
  
  var description: String {
  get {
    return "(\(x), \(y))";
  }
  }
  
  init(x _x: Double, y _y: Double) {
    x = _x;
    y = _y;
  }
  
  func dot(v: Vector) -> Double {
    return x * v.x + y * v.y;
  }
  
  func normalize() -> Vector {
    var magnitude = sqrt(dot(self));
    if (magnitude == 0) {
      return Vector(x: 0, y: 0);
    }
    return self * (1/magnitude);
  }
  
}

func *(lhs: Vector, rhs: Double) -> Vector {
  return Vector(x: lhs.x * rhs, y: lhs.y * rhs);
}

func +(lhs: Vector, rhs: Vector) -> Vector {
  return Vector(x: lhs.x + rhs.x, y: lhs.y + rhs.y);
}

func -(lhs: Vector, rhs: Vector) -> Vector {
  return Vector(x: lhs.x - rhs.x, y: lhs.y - rhs.y);
}

func += (inout left: Vector, right: Vector) {
  left = left + right;
}
