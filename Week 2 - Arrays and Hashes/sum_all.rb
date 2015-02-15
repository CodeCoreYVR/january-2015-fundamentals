def sum(*n)
  result = 0
  n.each {|x| result += x }
  result
end

puts sum
puts sum 1,2
puts sum(1,2,3,4)
puts sum 1,2,3,4,5