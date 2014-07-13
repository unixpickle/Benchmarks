require './Particle.rb'
require './Vector.rb'

if ARGV.length != 2
  puts 'Usage: ruby main.rb <time delta> <count>'
  exit 1
end

timeDelta = ARGV[0].to_f
count = ARGV[1].to_i

p1 = Particle.new Vector.new(0.3, 0), -1
p2 = Particle.new Vector.new(-0.3, 1), 1

count.times do
  force1 = p1.forceFrom p2
  force2 = p2.forceFrom p1
  p1.applyForce force1, timeDelta
  p2.applyForce force2, timeDelta
end

puts "p1 = #{p1}"
puts "p2 = #{p2}"
