
array  = []

# counter = 0
# while counter <= 100
#   if counter % 3 == 0 && counter % 5 == 0
#     array << "FIZZBUZZ"
#   elsif counter % 3 == 0
#     array << "FIZZ"
#   elsif counter % 5 == 0
#     array << "BUZZ"
#   else
#     array << counter
#   end
#   counter += 1
# end

for counter in 1..100
  if counter % 3 == 0 && counter % 5 == 0
    array << "FIZZBUZZ"
  elsif counter % 3 == 0
    array << "FIZZ"
  elsif counter % 5 == 0
    array << "BUZZ"
  else
    array << counter
  end
end

puts array
