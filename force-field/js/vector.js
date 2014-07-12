function Vector(x, y) {
  this.x = x || 0;
  this.y = y || 0;
}

Vector.prototype.subtract = function(v) {
  return new Vector(this.x - v.x, this.y - v.y);
};

Vector.prototype.add = function(v) {
  return new Vector(this.x + v.x, this.y + v.y);
};

Vector.prototype.scale = function(constant) {
  return new Vector(this.x * constant, this.y * constant);
};

Vector.prototype.addInPlace = function(v) {
  this.x += v.x;
  this.y += v.y;
};

Vector.prototype.dot = function(v) {
  return this.x * v.x + this.y * v.y;
};

Vector.prototype.normalize = function() {
  var magnitude = Math.sqrt(this.dot(this));
  if (magnitude == 0) return new Vector(0, 0);
  return this.scale(1 / magnitude);
};

Vector.prototype.toString = function() {
  return '(' + this.x + ', ' + this.y + ')';
};

module.exports = Vector;
