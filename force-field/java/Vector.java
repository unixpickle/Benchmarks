class Vector {
  
  public double x;
  public double y;
  
  public Vector(double _x, double _y) {
    this.x = _x;
    this.y = _y;
  }
  
  public Vector() {
    this.x = 0;
    this.y = 0;
  }
  
  public Vector subtract(Vector v) {
    return new Vector(x - v.x, y - v.y);
  }
  
  public Vector add(Vector v) {
    return new Vector(x + v.x, y + v.y);
  }
  
  public Vector scale(double d) {
    return new Vector(x * d, y * d);
  }
  
  public void addInPlace(Vector v) {
    x += v.x;
    y += v.y;
  }
  
  public double dot(Vector v) {
    return x * v.x + y * v.y;
  }
  
  public Vector normalize() {
    double magnitude = Math.sqrt(dot(this));
    if (magnitude == 0.0) return new Vector(0, 0);
    return scale(1.0 / magnitude);
  }
  
  public String toString() {
    return "(" + x + ", " + y + ")";
  }
  
}