var friends = {};

friends.bill = {}
friends.steve = {}


friends.bill.name  = "Bill"
friends.steve.name = "Steve"


for(var key in friends) {
  console.log(key);
}