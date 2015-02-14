names             = ["tom", "john", "aaron", "jennifer"]
capitalized_names = []

names.each do |name|
  capitalized = name.capitalize
  puts capitalized
  capitalized_names << capitalized
end

