words = ["hi", "greeting", "hello", "drew"]

def symbol(array)
  my_hash = {}
  array.each do |word|
    count = word.length
    my_hash[word.to_sym] = count
  end
  my_hash
end

print symbol(words)
