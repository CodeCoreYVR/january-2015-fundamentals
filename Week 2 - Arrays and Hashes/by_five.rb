puts "Enter a number"

a = gets.chomp.to_i

def by_five?(a)
  # Solution #1
  # if a % 5 == 0
  #   return true
  # else
  #   return false
  # end

  # Solution #2 - Ternary operator
  # (a % 5 == 0) ? true : false

  # Solution #3
  a % 5 == 0
end

puts by_five?(a)