"a".upto("h") {|letter| puts letter }

"a".upto("h") do |letter|
  if letter == "c"
    puts "C"
  else
    puts letter
  end
end