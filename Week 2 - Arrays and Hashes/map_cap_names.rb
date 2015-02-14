names = ["drew", "tam", "mike", "aaron", "john", "scott"]

cap_names = names.map do |name|
              name.capitalize.reverse
            end

print cap_names


names.map! do |name|
  name.capitalize.reverse
end

print names

