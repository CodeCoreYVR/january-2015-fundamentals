counter = 1

sentence = ""

while true
  print "Give me a word: "
  input = gets.chomp
  if input == "quit"
    break
  end
  # checking if the number is divislbe by 2 to see
  # if we are at an even word entey
  # another way to do that is to put:
  # if counter.even?
  if counter % 2 == 0
    sentence += input.upcase
  else
    sentence += input
  end
  counter += 1
end

puts sentence
