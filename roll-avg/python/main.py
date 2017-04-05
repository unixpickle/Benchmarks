import sys

def addUpTo(dest):
  summation = 0
  i = 1
  d = dest+1
  for i in range(1,d):
    summation += i
    
  return summation

def rollAverage(dest):
  average = 0.0
  i = 0
  for i in range(dest):
    average = (average + addUpTo(i)) / 2
  return average

if len(sys.argv) != 3:
  print('Usage: python main.py <start> <end>')
  exit(1)

start = int(sys.argv[1])
end = int(sys.argv[2])
while start <= end:
  print('rollAverage(' + str(start) + ') = ' + str(rollAverage(start)))
  start += 1
