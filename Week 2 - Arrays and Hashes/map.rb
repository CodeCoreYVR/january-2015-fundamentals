my_array = [1,2,3]

puts my_array.map { |x| x * x }

my_array.map do |x|
  x * x
end

