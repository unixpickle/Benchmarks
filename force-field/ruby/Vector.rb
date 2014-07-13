class Vector
  attr_accessor :x
  attr_accessor :y
  
  def initialize(x, y)
    @x = x
    @y = y
  end
  
  def subtract(v)
    Vector.new @x - v.x, @y - v.y
  end
  
  def add(v)
    Vector.new @x + v.x, @y + v.y
  end
  
  def scale(s)
    Vector.new x * s, y * s
  end
  
  def addInPlace(v)
    @x += v.x
    @y += v.y
  end
  
  def dot(v)
    @x * v.x + @y * v.y
  end
  
  def normalize()
    magnitude = Math.sqrt self.dot self
    if magnitude == 0
      return Vector.new 0, 0
    end
    self.scale 1.0 / magnitude
  end
  
  def to_s
    "(#{@x}, #{@y})"
  end
end
