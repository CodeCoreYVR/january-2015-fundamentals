print "Give me a sentence: "

sentence = gets.chomp.split

sentence.each do |word|
  print word.capitalize + " "
end
