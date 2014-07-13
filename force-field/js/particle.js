var Vector = require('./vector');

function Particle(position, mass) {
  this.position = position;
  this.mass = mass;
  this.velocity = new Vector();
}

Particle.prototype.forceFrom = function(p) {
  var distance = p.position.subtract(this.position);
  var magnitude = this.mass * p.mass / distance.dot(distance);
  return distance.normalize().scale(magnitude);
};

Particle.prototype.applyForce = function(force, timeDelta) {
  this.velocity.addInPlace(force.scale(timeDelta / Math.abs(this.mass)));
  this.position.addInPlace(this.velocity.scale(timeDelta));
};

Particle.prototype.toString = function() {
  return '{Particle mass: ' + this.mass + ' velocity: ' + this.velocity
    + ' position: ' + this.position + '}';
};

module.exports = Particle;
