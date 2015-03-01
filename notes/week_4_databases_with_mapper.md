# Databases with Mapper  
With what we did yesterday, we were saving everything in memory, so after the request response happens, everything is gone.

To save data from the user, we have different options. We can save the data just to a file. The problem with this is it bcomes slow, and becomes problmeatic, because, what if lots of users are opening the same file at the same file, and searching through a file can become quite slow.  

With databases, you structure your data, you put it in a structured fashion. You can easily store and retrieve your data. There are two main database structures. One is called a relational database, and the other is called NoSQL. We may go over a NoSQL DB like MongoDB on a Saturday or something, but for the most part, we will be focusing on relational databases.  
  
NoSQL databases use key values, documents, different ways to store data. Relational databases use a langauge called SQL, which is a language used to query, fetch, and store data in databases. The one we are going to use today is sqlite3. Sqlite3 is a very lightweight development database. It's not meant for production. It stores all the data in one big binary file. It's great for a situation where you're building a quick app and want to test it. Otherwise, we'll use something like MySQL or Postgres. We'll use Postgres in this course.  

The basis of any relational database is tables. Every table has columns and rows. You store your data in rows, and structure your data in columns.  

If I have a user in my database, I have columns such as `first_name, last_name, email, phone_number`. You store the use info in rows.  

ex table  

In tabels we need a primary key. We usually use something called an `id`. We can't have two rows with an id of 1, otherwise, we won't be able to identify that row. I need to get the user by the primary key, which in this case is the id.

The main we use to operations on databases is called CRUD (Create, Read, Update, and Destroy).  

We'll see later we don't have to use SQL, but if you were to use SQL to create a table in the databse, you'd do something like this  
```sql
CREATE TABLE users(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  email VARCHAR(255),
  phone_number: VARCHAR(255)
)
```

There's also insert, select, delete...   
```sql
INSERT INTO users(first_name, last_name, email, phone_number) VALUES("Tam", "Kbeili", "tam@codecore.ca", "(778) 555-5555")

SELECT * FROM users WHERE id = 1;
DELETE FROM users WHERE id=1;
```  

If you go inside your terminal and want to play with SQL, just open it up and type `sqlite3`.  
```sql  
-- Here you can try some commands like CREATE, INSERT, SELECT, and DELETE.
```  

## ORM  
We are going to use something called an *ORM*. If I have an object in Ruby, they have numbers. To map an object to a relation, we need something called an ORM (Object Relation Map). Just like we had a class, `user` with different objects inside of it. We used an ID.  

We are going to use a gem called "data mapper" Start by installing it, `gem install data_mapper`  
If you want to use [Data Mapper](http://datamapper.org/), the first step is to require it in your app.rb  
**note**: Check out the [documentation](http://datamapper.org/getting-started.html). 
```ruby
# app.rb
require 'sinatra'
require 'pony'
require 'data_mapper'                                               # require the data_mapper gem

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/contacter.db")    # specify your db connection

get "/" do
    erb :index
end

get "/contact" do
    erb :contact
end

post "/contact" do
  "Thank you!"
end

get "/thank you" do
    Pony.mail(to: "tam@comcodecore.ca",
          from: params[:email],
          subject: "You got a new message from #{params[:name]}",
          :body => params[:message],
          :via => :smtp,
          :via_options => {
          :address        => 'smtp.gmail.com',
          :port           => '587',
          :user_name      => 'answerawesome',
          :password       => 'Sup3r$ecret',
          :authentication => :plain, # :plain, :login, :cram_md5, no auth by default
          :domain         => "awesomeanswer.com" # the HELO domain provided by the client to the server
          }
     )
  "Thank you #{params[:name]} for contacting us."
end
```  
The next step is to create a class. We'll create a class called user, in the same directory as your app.rb.  
```ruby
# user.rb
class User
  
  include DataMapper::Resource

  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :email, String
  property :phone_number, String
  property :note, Text


end
```  

We have only defined properties inside the class, we have not created a database. To do this we need to call `DataMapper.finalize`, and `User.auto_upgrade!`. You don't have to memorize this, you can check the [documentation](http://datamapper.org/getting-started.html).  
```ruby
# user.rb
class User
  
  include DataMapper::Resource

  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :email, String
  property :phone_number, String
  property :note, Text

end

  DataMapper.finalize
  User.auto_upgrade!
```  
To use a user file inside our app, we need to require it.  
```ruby
# app.rb
require 'sinatra'
require 'pony'
require 'data_mapper'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/contacter.db")

require './user.rb'                   # Require the user class

get "/" do
    erb :index
end

get "/contact" do
    erb :contact
end

post "/contact" do
  "Thank you!"
end

get "/thank you" do
    Pony.mail(to: "tam@comcodecore.ca",
          from: params[:email],
          subject: "You got a new message from #{params[:name]}",
          :body => params[:message],
          :via => :smtp,
          :via_options => {
          :address        => 'smtp.gmail.com',
          :port           => '587',
          :user_name      => 'answerawesome',
          :password       => 'Sup3r$ecret',
          :authentication => :plain, # :plain, :login, :cram_md5, no auth by default
          :domain         => "awesomeanswer.com" # the HELO domain provided by the client to the server
          }
     )
  "Thank you #{params[:name]} for contacting us."
end
```  
It's a good idea to play with DataMapper in IRB, so go to IRB, and put `require "data_mapper"`, then copy this line here: `DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/contacter.db")` This is the line that sets up the database.  
**note**: If you get a load error, make sure to have the dependencies installed. Check the docs. For sqlite3, you will need to have the dm-sqlite-adapter gem installed. `gem install dm-sqlite-adapter`.  

You should notice that this created something like:  
```sql
DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/contacter.db")
#<DataMapper::Adapters::SqliteAdapter:0x0000010209cda8 @name=:default, @options={"scheme"=>"sqlite3", "user"=>nil, "password"=>nil, "host"=>"", "port"=>nil, "query"=>nil, "fragment"=>nil, "adapter"=>"sqlite3", "path"=>"/Users/ogryzek/CodeCore/cohort2/ruby/week1_homework/sinatra/contacter.db"}, @resource_naming_convention=DataMapper::NamingConventions::Resource::UnderscoredAndPluralized, @field_naming_convention=DataMapper::NamingConventions::Field::Underscored, @normalized_uri=#<DataObjects::URI:0x0000010209c560 @scheme="sqlite3", @subscheme=nil, @user=nil, @password=nil, @host="", @port=nil, @path="/Users/ogryzek/CodeCore/cohort2/ruby/week1_homework/sinatra/contacter.db", @query={"scheme"=>"sqlite3", "user"=>nil, "password"=>nil, "host"=>"", "port"=>nil, "query"=>nil, "fragment"=>nil, "adapter"=>"sqlite3", "path"=>"/Users/ogryzek/CodeCore/cohort2/ruby/week1_homework/sinatra/contacter.db"}, @fragment=nil, @relative=nil>>
```

Now, go into user.rb or just use `require './user.rb'`  Now we can do something like  
```irb
User.create(first_name: "Tam", last_name: "Kbeili", phone_number: "778.994.8779", email: "tam@codecore.ca", note: "asdksadkjsahdksadskdjh")
```  
This will create something like this  
```irb
#<User @id=1 @first_name="Tam" @last_name="Kbeili" @email="tam@codecore.ca" @phone_number="778.994.8779" @note="asdksadkjsahdksadskdjh">
```  
You will notice this is a hash, passing in keys and values, using symobols.  

__*Aside*__: There's a distinction between a relational database, and a non relational database. In Ruby, if you do not provide an ID, it will just be null. in non relational databases, if you don't provide a value, it will be nothing. It will just not exist.  
  
If I want to create 10 users, what would I do?  
```irb
10.times do
  User.create(first_name: "Tam", last_name: "Kbeili", phone_number: "778.994.8779", email: "tam@codecore.ca", note: "asdksadkjsahdksadskdjh")
end
```  
To get the first user, try  
```irb
user = User.get(1)
```  
I can also do attribute accessors.  
```irb
user.first_name = "Tamman"
user.save
```  
Now, if you try `User.get(1)` you'll notice the first name has changed.  
To delete a user, you can do `user.destroy`.  
To create a new user, you can do
```irb
user = User.new
user.first_name = "Tam"
user.last_name = "Kbeili"
user.save
User.last

# To create a user in one step
User.create(first_name: "Tam", last_name: "Kbeili")
```  
Let's now apply that in Sinatra. Let's save a user to the database. Get the [SQLite Database Browser](http://sourceforge.net/projects/sqlitebrowser/). Then after you download it, select file > open database, then navigate to the folder which has the contacter.db file, and click to open it. You can then try the 'execute sql' tab, and execute the sql query `SELECT * FROM users;`
**Note**: Notice how now in your app, there is a contacter.db.  
  
Add a way to create users in your app.rb
```ruby
# app.rb
require 'sinatra'
require 'pony'
require 'data_mapper'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/contacter.db")

require './user.rb'

get "/" do
    erb :index
end

get "/contact" do
    erb :contact, layout: :default_template
end


post "/contact" do
    @user = User.create(first_name: params[:name], 
                email: params[:email],
                note: "User ontact form #{params[:message]}")
    Pony.mail(to: "tam@comcodecore.ca",
          from: params[:email],
          subject: "You got a new message from #{params[:name]}",
          :body => params[:message],
          :via => :smtp,
          :via_options => {
          :address        => 'smtp.gmail.com',
          :port           => '587',
          :user_name      => 'answerawesome',
          :password       => 'Sup3r$ecret',
          :authentication => :plain, # :plain, :login, :cram_md5, no auth by default
          :domain         => "awesomeanswer.com" # the HELO domain provided by the client to the server
          }
     )
  "Thank you #{params[:name]} for contacting us."
end
```  
Close out the sqlite3 browser, run your app, and go to contact, then try saving a new user. 

  
We should include an erb file to render the thank you. Let's put in our app.rb an erb :thank_you

create a new file called thank_you.erb and change the app.rb to use it  
```ruby
require 'sinatra'
require 'pony'
require 'data_mapper'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/contacter.db")

require './user.rb'

get "/" do
    erb :index
end

get "/contact" do
    erb :contact
end

post "/contact" do
    @user = User.create(first_name: params[:name], 
                email: params[:email],
                note: "User ontact form #{params[:message]}")
    Pony.mail(to: "tam@comcodecore.ca",
          from: params[:email],
          subject: "You got a new message from #{params[:name]}",
          :body => params[:message],
          :via => :smtp,
          :via_options => {
          :address        => 'smtp.gmail.com',
          :port           => '587',
          :user_name      => 'answerawesome',
          :password       => 'Sup3r$ecret',
          :authentication => :plain, # :plain, :login, :cram_md5, no auth by default
          :domain         => "awesomeanswer.com" # the HELO domain provided by the client to the server
          } )
  erb :thank_you, layout: :default_template
end
```  
The thank_you.erb
```erb
<h1>Thank you for contacting us</h1>

We will reply to your email: <%= @user.email %>
```  
Instead of just updating the database, if you want automapper to auto migrate, you can add the line `DataMapper.auto_migrate!` to your user.rb.  
```ruby
class User
  
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :email, String
  property :phone_number, String
  property :note, Text

end

  DataMapper.finalize

  # DataMapper.auto_migrate!        # note: This will rewrite your database
  
  User.auto_upgrade!
```  
To add a view where you can see all the users in the database, create a method in your `app.rb` called /users
```ruby
# app.rb
get "/users" do
  @users = User.all
  erb :users, layout: :default_template
end

```  
Then, create a users.erb in your views directory  
```erb
# views/users.erb
<h1>Listing all users</h1>

<table width="100%">
  <tr>
    <th>ID</th>
    <th>Name</th>
    <th>Email</th>
    <th>Note</th>
  </tr>

<% @users.each do |user| %>
  <tr>
    <td><%= user.id %></td>
    <td><%= user.name %></td>
    <td><%= user.email %></td>
    <td><%= user.note %></td>
  </tr>
<% end %>

</table>
```  
Let's make a method in our `app.rb` to get an individual user. Then if I put in the url, users/abc, users/1, users/2, then that will go to the `get "/user/:id" ` method
```ruby
# app.rb
#...
get "/users/:id" do |id|
  @user = User.get(id)
  erb :user, layout: :default_template
end
#...
```   
Then create a `user.erb` page in your views directory to display the user information.  
```erb
# views/user.erb
<h1>Page for: <%= @user.name %></h1>
<p>email: <%= @user.email %></p>
<p>note: <%= @user.note %> </p>
```  
Let's add a link to the user's name on the page that displays all users.  
```erb
# views/users.erb
<h1>Listing all users</h1>

<table width="100%">
  <tr>
    <th>Name</th>
    <th>Email</th>
    <th>Note</th>
  </tr>

<% @users.each do |user| %>
  <tr>
    <td><%= user.id %></td>
    <td><a href="users/<%= user.id %>"><%= user.name %></a></td>
    <td><%= user.email %></td>
    <td><%= user.note %></td>
  </tr>
<% end %>

</table>
```  
##Exercise:  
1.) Add another column to users called 'admin_note'. And when you are viewing the user page, there should be a field on the user page with the ability to add an admin note.  
```ruby
# app.rb
# Add a post action to the user page using the user's id

post "/users/:id" do |id|
  @user = User.get(id)
  @user.admin_note = params[:admin_note]
  @user.save
  redirect "users/"
end
```  
```erb
# views/users.erb
# Add a form on the user page to post an admin_note

<form action="/users/<%= @user.id %>" method="post">
  <label for="admin_note">Admin Note</label>
  <br>
  <textarea rows="5" id="admin_note" name="admin_note"></textarea>
  <br>
  <input type="submit" value="Add Admin Note">
</form>
```
```ruby
# user.rb
# Add a field for admin_note to your user.rb
class User
  
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :email, String
  property :phone_number, String
  property :note, Text
  property :admin_note, Text

end

  DataMapper.finalize

  #DataMapper.auto_migrate!

  User.auto_upgrade!
```  

## Rack  
Sinatra, like Rails, uses a gem called [Rack](https://github.com/rack/rack). This gives us the ability to handle HTTP authentication.  
To use rack's sessions for HTTP authentication, have a look at the Sinatrarb.com FAQ [sessions](http://www.sinatrarb.com/faq#sessions) section, and copy and add the code to your app.rb  
```Ruby
# app.rb
enable :sessions
```  
***note***: This is a very simple single user sign-in authentication. It would be useful for a private blog or CMS, but not so great for a multiple user application.  
  
Sessions use cookies to store some user information. We have access to this variable in Sinatra called `session` and can use it in various ways, for example...   
```ruby
session[:background_color] = params[:purple]
```  
Let's say I want to store the user that's visited last. I might add a session like this to the user controller in my app.rb  
```ruby
# app.rb

#...
get "/users/:id" do |id|
  @user = User.get(id)
  session[:user_name] = @user.name
  erb :user, layout: :default_template
end

#...

```  
And add a line to view the last user visited by name into the default template
```erb
# views/default_template.erb
<html>

<head>
  <title>This is my title</title>

  <meta charset="UTF-8">

</head>
<body>
  The last visitor you visited was <%= @user.name %>

    <%= yield %>

</body>
</html
```  
2.) Implement a way for your site visitors to pick a background color that stays as long as they are logged in.  
Add a method to the app.erb to set a session variable called color  
```ruby
# app.erb
#...

get "/set_color/:color" do |color|
  session[:color] = color
  redirect back
end
# ...
```  
Add a way for users to set the color by link in the default template and styles to use them.  

```ruby
# views/default_tamplate.erb
<html>

<head>
  <title>This is my title</title>

  <meta charset="UTF-8">
  <style>
    body {
      background-color: <%= session[:color] || "blue" %>
  }

  </style>

</head>
<body>

  <% if session[:user_name] %>
    the last user you visited is <%= session[:user_name] %>
  <% end %>

  <a href="/set_color/blue">blue</a> |
  <a href="/set_color/red">red</a> |
  <a href="/set_color/green">green</a>

    <%= yield %>

</body>
</html>
```   
## Deploying to Heroku  
You need to use a gem called bundler, before deploying to Heroku. Create a new file in your app's main directory called Gemfile (with a capital 'G' and no extension). This Gemfile will allow us to require all the gems we need in one file, rather than manually requiring all the gems we need in our app.rb. Here we will use *gem* instead of *require*  
```Ruby
# Gemfile
source 'http://rubygems.org'

gem 'sinatra'
gem 'pony'
gem 'data_mapper'
gem 'dm-postgres-adapter'         # Note: Heroku only uses postgres
```  
To actually push to Heroku, you'll need to have Postgres. Change the DataMapper.setup line in your `app.rb` to:  
```ruby
# app.rb
#...

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/mydatabase.db")

#...
```  
Heroku uses `ENV['DATABASE_URL']` to assign a database to our app, and locally we're using sqlite3.  

You'll want to get the [Heroku Toolbelt](https://toolbelt.heroku.com). If you don't already have a login create a heroku account.  

You will also ned an [ssh key](https://help.github.com/articles/generating-ssh-keys)  

First check to see if you have any ssh keys: `ls -a ~/.ssh`. If you have an id_rsa.pub, you can view it with `cat ~/.ssh/id_rsa.pub` this will give some output similar to:  
```bash
ssh-rsa AABBB3NzaC1yc2EAAAADAQABAAABAQDYwumxwIoBx3Mr7MPcI9pCxQmTp0RfQgjtxOF7wIHnIuwRQ5ouE4MAZAvEsYJ/4/Gzk0OSDnnfHjGM0WCaXoLVIr60FgE1kcfwkwxkizUXJBaKdWaJ7LWYrvmF5kcgt/EOHvRdFijB4TuQee2jd1Z8mrpDDeB3syrgfP1EOqP8M9ZJ+YepqBDf8a4/fka5DqrP1cfjJKIp0CxOEq3FbvVMkCuXQXaQevzFJ0hJkjFprsEWsJimaRFJsMp1wvepzMRPFCjPmf9+j65Lu9h6O7ghqvpINhdP52N/L9CYxNckS9iQAjikOcIHhonMcAqdCNVYHmax9B6CWj4NN5C3h45F myemail@example.com
```  
Copy the whole thing, from (and including) "ssh-rsa" to "myemail@example.com", then while logged into [heroku](http://www.heroku.com), click on your profile (upper right), select 'acount' from the dropdown menu, scroll down to the ssh key section, and paste it into the input field to add a new ssh-key.

Then inside your application, do `gem install bundler` and while inside the root of your application run `bundle install`, and then run `rackup` and see your app on port 9292
  
Initialize a git repo, and make sure you have the heroku gem installed.  
```bash
git init
git add .
git commit -m "My first Sinatra app"

gem install heroku
``` 

You should now be able to push your app to [heroku](https://devcenter.heroku.com/articles/git).  
```bash
heroku create
git push heroku master
```  
