def addUpTo(dest)
  sum = 0
  i = 1
  while i <= dest
    sum += i
    i += 1
  end
  return sum
end

def rollAverage(dest)
  average = 0.0
  dest.times do |x|
    average = (average + addUpTo(x)) / 2.0
  end
  return average
end

if ARGV.length != 2
  puts 'Usage: ruby main.rb <start> <end>'
  exit 1
end

start = ARGV[0].to_i
endNum = ARGV[1].to_i

while start <= endNum
  puts "rollAverage(#{start}) = #{rollAverage(start)}"
  start += 1
end
