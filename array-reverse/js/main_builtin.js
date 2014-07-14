if (process.argv.length !== 4) {
  console.error('Usage: node main.js <size> <iterations>');
  process.exit(1);
}

var size = parseInt(process.argv[2]);
var iterations = parseInt(process.argv[3]);

// generate the array
list = []
for (var i = 0; i < size; i++) {
  list.push(i);
}

for (var i = 0; i < iterations; i++) {
  list.reverse();
}
