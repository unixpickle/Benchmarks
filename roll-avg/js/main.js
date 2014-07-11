/**
 * Adds integers up to and including `dest` and returns the sum.
 */
function addUpTo(dest) {
  var sum = 0;
  for (var i = 1; i <= dest; i++) {
    sum += i;
  }
  return sum;
}

/**
 * Run a "rolling average" on a set of sums of consecutive integers.
 */
function rollAverage(dest) {
  var average = 0.0;
  for (var i = 0; i < dest; i++) {
    average = (average + addUpTo(i)) / 2.0;
  }
  return average;
}

if (process.argv.length !== 4) {
  console.error('Usage: node main.js <start> <end>');
  process.exit(1);
}

var start = parseInt(process.argv[2]);
var end = parseInt(process.argv[3]);
for (var i = start; i <= end; i++) {
  console.log('rollAverage(' + i + ') = ' + rollAverage(i));
}
