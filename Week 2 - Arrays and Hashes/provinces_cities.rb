provinces = {"BC" => ["Victoria", "Vancouver"], 
             "AB" => ["Edmonton", "Calgary"], 
             "ON" => ["Toronto", "Ottawa"]}

provinces.each do |prov, cities|
  city_string = cities.join(", ")
  puts "#{prov}: #{city_string}"
end
