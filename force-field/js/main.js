var Particle = require('./particle');
var Vector = require('./vector');

if (process.argv.length !== 4) {
  console.error('Usage: node main.js <time delta> <count>');
  process.exit(1);
}

var timeDelta = parseFloat(process.argv[2]);
var count = parseInt(process.argv[3]);

var p1 = new Particle(new Vector(0.3, 0), -1);
var p2 = new Particle(new Vector(-0.3, 1), 1);

for (var i = 0; i < count; i++) {
  var force1 = p1.forceFrom(p2);
  var force2 = p2.forceFrom(p1);
  p1.applyForce(force1, timeDelta);
  p2.applyForce(force2, timeDelta);
}

console.log('p1 = ' + p1);
console.log('p2 = ' + p2);
