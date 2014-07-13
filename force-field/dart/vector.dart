import 'dart:math';

class Vector {
  double x;
  double y;
  
  Vector(this.x, this.y) {
  }
  
  Vector operator -(Vector v) {
    return new Vector(x - v.x, y - v.y);
  }
  
  Vector operator +(Vector v) {
    return new Vector(x + v.x, y + v.y);
  }
  
  Vector operator *(double d) {
    return new Vector(x * d, y * d);
  }
  
  void addInPlace(Vector v) {
    x += v.x;
    y += v.y;
  }
  
  double dot(Vector v) {
    return x * v.x + y * v.y;
  }
  
  Vector normalize() {
    double magnitude = sqrt(dot(this));
    if (magnitude == 0) return new Vector(0, 0);
    return this * (1.0 / magnitude);
  }
  
  String toString() {
    return "(${x}, ${y})";
  }
  
}
