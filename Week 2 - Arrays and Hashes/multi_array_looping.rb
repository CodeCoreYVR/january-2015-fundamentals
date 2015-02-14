my_array = [[1,2,3], [1,2,3], [1,2,3], [1,2,3]]

my_array.each do |array|
  array.each do |number|
    puts number
  end
end

my_array.flatten.each do |number|
  puts number
end
