//
//  Particle.swift
//  force-field
//
//  Created by Alex Nichol on 7/12/14.
//  Copyright (c) 2014 Alex Nichol. All rights reserved.
//

import Foundation

class Particle: Printable {
  var position: Vector;
  var mass: Double;
  var velocity: Vector;
  
  var description: String {
  get {
    return "{Particle mass: \(mass) velocity: \(velocity) position: \(position)}";
  }
  }
  
  init(position _pos: Vector, mass _mass: Double) {
    position = _pos;
    mass = _mass;
    velocity = Vector(x: 0, y: 0);
  }
  
  func forceFrom(p: Particle) -> Vector {
    var distance = p.position - position;
    var magnitude = mass * p.mass / distance.dot(distance);
    return distance.normalize() * magnitude;
  }
  
  func applyForce(force: Vector, timeDelta: Double) {
    velocity += force * (timeDelta / fabs(mass));
    position += velocity * timeDelta;
  }
  
}
