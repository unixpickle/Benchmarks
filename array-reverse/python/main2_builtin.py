import sys

if len(sys.argv) != 3:
  print('Usage: python main2.py <size> <iterations>')
  exit(1)

size = int(sys.argv[1])
iterations = int(sys.argv[2])

myList = range(0, size)

for i in xrange(0, iterations):
  myList.reverse()
