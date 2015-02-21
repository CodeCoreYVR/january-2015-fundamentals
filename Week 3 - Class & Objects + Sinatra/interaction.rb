load "./bird.rb"
load "./cat.rb"

bird_1 = Bird.new("Tweetie")
bird_2 = Bird.new("Regus")

cat   = Cat.new("Tom")

cat.eat

cat.catch bird_1
cat.catch bird_2

cat.eat
cat.eat
cat.eat
