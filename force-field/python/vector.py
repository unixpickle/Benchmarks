import math

class Vector:
  def __init__(self, x, y):
    self.x = x
    self.y = y
  
  def subtract(self, v):
    return Vector(self.x - v.x, self.y - v.y);
  
  def add(self, v):
    return Vector(self.x + v.x, self.y + v.y);
  
  def addInPlace(self, v):
    self.x += v.x
    self.y += v.y
  
  def scale(self, s):
    return Vector(self.x * s, self.y * s);
  
  def dot(self, v):
    return self.x * v.x + self.y * v.y
  
  def normalize(self):
    magnitude = math.sqrt(self.dot(self))
    if magnitude == 0: return Vector(0, 0)
    return self.scale(1.0 / magnitude)
  
  def __str__(self):
    return "(" + str(self.x) + ", " + str(self.y) + ")"
