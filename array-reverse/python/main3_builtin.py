import sys

if len(sys.argv) != 3:
  print('Usage: python3 main3_builtin.py <size> <iterations>')
  exit(1)

size = int(sys.argv[1])
iterations = int(sys.argv[2])

myList = list(range(0, size))

for i in range(0, iterations):
  myList.reverse()
