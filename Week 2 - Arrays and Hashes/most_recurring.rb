print "Give me a sentence: " 

sentence = gets.chomp

char_recurrences = Hash.new(0)

#  sentence.split("").each do |char|
sentence.each_char do |char|
  char_recurrences[char] += 1
end

char_recurrences.each do |k,v|
  puts "#{k}: #{v}"
end

puts char_recurrences.max_by{|k,v| v}[0]

# sentence.each_char.inject(Hash.new(0)){|r,v| r[v] += 1; r}.max_by{|k,v| v}[0]