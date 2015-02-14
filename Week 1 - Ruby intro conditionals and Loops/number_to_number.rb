puts "Please give me a number"
n1 = gets.chomp.to_i

puts "Please give me another number"
n2 = gets.chomp.to_i

puts "____________________"

if n1 < n2
  n1.upto(n2) {|num| puts num}
else
  n2.upto(n1) {|num| puts num}
end
