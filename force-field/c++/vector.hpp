#ifndef __FORCE_FIELD_VECTOR_HPP__
#define __FORCE_FIELD_VECTOR_HPP__

#include <cmath>
#include <iostream>

/**
 * A simple 2D vector.
 */
struct Vector {
  double x;
  double y;
  
  Vector() : x(0), y(0) {}
  Vector(double _x, double _y) : x(_x), y(_y) {}
  Vector(const Vector & v) : x(v.x), y(v.y) {}
  
  Vector & operator=(const Vector & v) {
    x = v.x;
    y = v.y;
    return *this;
  }
  
  Vector operator-(const Vector & v) const {
    return Vector(x - v.x, y - v.y);
  }
  
  Vector operator+(const Vector & v) const {
    return Vector(x + v.x, y + v.y);
  }
  
  Vector operator*(double d) const {
    return Vector(x * d, y * d);
  }
  
  Vector operator+=(Vector v) {
    x += v.x;
    y += v.y;
    return *this;
  }
  
  double Dot(const Vector & v) const {
    return x * v.x + y * v.y;
  }
  
  Vector Normalize() const {
    double magnitude = sqrt(Dot(*this));
    if (magnitude == 0) return Vector(0, 0);
    return (*this) * (1.0 / magnitude);
  }
};

std::ostream & operator<<(std::ostream & stream, const Vector & v) {
  return stream << "(" << v.x << ", " << v.y << ")";
}

#endif
