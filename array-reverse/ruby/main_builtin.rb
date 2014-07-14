if ARGV.length != 2
  puts 'Usage: ruby main.rb <size> <iterations>'
  exit 1
end

size = ARGV[0].to_i
iterations = ARGV[1].to_i

list = (0...size).to_a

iterations.times do
  list.reverse!
end