# Sinatra

Create a new folder called sinatra, and cd into it.  
```bash
mkdir sinatra
cd sinatra
```
Create a new file called app.rb
```ruby
# app.rb
require 'sinatra'

get "/" do
  "Hello CodeCore"
end
```
To start your app, just run `ruby app.rb`. It will then be available on your localhost at port [4567](http://localhost:4567/).  
  
REST (ReprEsentational State Transfer) is pretty simple in that it uses:
  * HTTP verbs: Get, Post, Put, Patch, Delete
  * URL: /, /url, /hello, /blog/1
  * params: /blog?a=5, /search?num=100&site=&source=hp&q=ruby+on+rails&oq=ruby+on+rails
  * 
  
Let's add some more to the app.rb
```ruby
# app.rb
get "/" do
  "Hello CodeCore"
end

get "/hi" do
  "Hi CodeCore"
end
``` 
We can see the root of our site http://localhost:4567 still looks the same. To access this new url /hi, we just append it to the end: http://localhost:4567/hi  
  
The HTTP verb get is used to fetch information from the database, post is used to create something, like a new form entry. put or patch are used for updating existing records, and delete is used to delete.  
  
Rather than render text it would be much more meaningful to add html to display. In this case, we're going to use a ruby html templating language called [erb](http://ruby-doc.org/stdlib-2.1.1/libdoc/erb/rdoc/ERB.html).  
  
Inside your sinatra directory, create a new folder called 'views', and inside it create a file called 'index.erb'.  
```erb
<% # sinatra/views/index.erb %>
<!DOCTYPE html>

<meta charset="UTF-8">

<title>My first sinatra app!</title>

<h1>Yo, Yo, Yo!</h1>
```
Now to make it render this rather than text, open up the app.rb and change it from 'Hello CodeCore' to erb :index.  
```ruby
# app.rb
get "/" do
  erb :index
end

get "/hi" do
  "Hi CodeCore"
end
```
Now, we can add a default template for all the html pages to use. Let's create a file for it in our views folder. ***Note***: we add a yield for it to display the data from other files.    
```erb
<!DOCTYPE html>

<meta charset="UTF-8">

<title>My first sinatra app!</title>

<%= yield %>
```
We can then just tell our index page and other pages to use it in the app.rb
```ruby
require 'sinatra'

get "/" do
  erb :index, layout: :default_template
end

get "/hi" do
  erb :hi, layout: :default_template
end
```
And then we can change the index.erb to just have a header
```erb
<!-- views/index.erb -->
<h1>Yo, Yo, Yo!</h1>
```
And add a hi.erb in views
```erb
<!-- views/hi.erb -->
<h1>Hi CodeCore!</h1>
```
Let's display a page where someone can contact us view email. Add to the app.rb
```ruby

# ...
  get "/contact" do
  end
  
# ...
```
And make a contact.erb file in the views folder.
```ruby
<h1>Contact Us</h1>
```
We want to put a form for our users to be able to fill in and submit. 
```erb
<h1>Contact Us</h1>

<form action="/contact" method="post">
  <input type="text" placeholder="enter your first name" name="first_name">
  <input type="text" placeholder="enter your last name" name="last_name">
  <input type="text" placeholder="enter your last email" name="email">
  <input type="textarea" placeholder="enter your message" name="message">
  <input type="submit" value="Contact Us">
</form>
```
Since we get params for any parameter entered in the form through the HTTP post request, we can access this name variable with params[:first_name]  
  
Let's modify our app.rb for the contact post request.  
```ruby
# app.rb
 # ...
  post "/contact" do
    full_name = "#{params[:first_name]} #{params[:last_name]}"
    "Thank you #{full_name} for submitting."
  end

 # ...
 ```
To use third party libraries and other things in your app, create a directory called 'public'. Go to [getbootstrap](http://getbootstrap.com/) and download it. And put its css, fonts, and javascript contents into the public directory.  
  
To give access to the classes in bootstrap, modify the default template to have a link to the stylesheet, and to have a div with the class of [container](http://getbootstrap.com/css/#overview-container) to wrap around all the body text.  
```erb
<meta charset="UTF-8">

<title>My first sinatra app!</title>

<link rel="stylesheet" href="/css/bootstrap.min.css">

<div class="container">

<%= yield %>

</div>
```
Now you can add the form classes to your form, and bootstrap will make it look pretty, and let's also add some radio check fields.    
```erb
<h1>Contact Us</h1>

<form action="/contact" method="post">
  <div class="form-group">
    <input type="radio" name="department" value="sales"> Sales
    <input type="radio" name="department" value="marketing"> Marketing
    <input type="radio" name="department" value="technical"> Technical
  </div>
  <div class="form-group">
    <input type="text" placeholder="enter your first name" name="first_name" class="form-control">
  </div>
  <div class="form-group">
    <input type="text" placeholder="enter your last name" name="last_name" class="form-control">
  </div>
  <div class="form-group">
    <input type="text" placeholder="enter your last email" name="email" class="form-control">
  </div>
  <div class="form-group">
    <input type="textarea" placeholder="enter your message" name="message" class="form-control">
  </div>
  <div class="form-group">
    <input type="submit" value="Contact Us" class="btn btn-default">
  </div>
</form>
```
Now that we have radio buttons, let's modify our contact post action to include the department params.
```ruby
post "/contact" do
  full_name = "#{params[:first_name]} #{params[:last_name]}"
  "<strong>department</strong>: #{params[:department]}
   <strong>name</strong>: #{full_name}
   <strong>email</strong>: #{params[:email]}
   <strong>message</strong>: #{params[:message]}"
end
```
Let's add [Pony Mailer](https://github.com/benprew/pony) to our app. `gem install pony` then, open up the app.rb and add the right stuff.  
```ruby
Pony.mail(to: "drew@drewbro.com", 
          from: params[:email],
          reply_to: params[:email],
          subject: "Message for #{params[:department]}",
          body: params[:message])
```
To make this mailer more robust and use an actual email server, such as Google's, we can this:  
```ruby
post "/contact" do
  Pony.mail(to: "123and@gmail.com",
                 from: params[:email],
                 reply_to: params[:email],
                 subject: "Message for #{params[:department]}",
                 body: params[:message],
                 via: :smtp,
                 via_options: {
                   address:               "smtp.gmail.com",
                   port:                  "587",
                   enable_starttls_auto:  true,
                   user_name:             "[your-gmail-address]",
                   password:              "[your-gmail-password",
                   authentication:        :plain,
                   domain:                "localhost"
                 })
end
```
Rather than have all this logic in our controller, we can move these several lines of code into their own class. In the same directory as our app.rb, create a file called email_sender.rb  
```ruby
require 'pony'
class EmailSender

  def self.send(params)
    Pony.mail(to: "123and@gmail.com",
                     from: params[:email],
                     reply_to: params[:email],
                     subject: "Message for #{params[:department]}",
                     body: params[:message],
                     via: :smtp,
                     via_options: {
                       address:               "smtp.gmail.com",
                       port:                  "587",
                       enable_starttls_auto:  true,
                       user_name:             "drew@codecore.ca",
                       password:              "ogden123",
                       authentication:        :plain,
                       domain:                "localhost"
                     })
  end
end
```
Since we have taken all of this code out of our app.rb, we still need to call it, but we can remove the bulk of it. Open up your app.rb. ***note***: change the require 'pony' at the top to './email_sender.rb'
```ruby
require 'sinatra'
require './email_sender.rb'

get "/" do
  erb :index, layout: :default_template
end

get "/hi/:name" do |name|
  @name = name
  erb :hi, layout: :default_template
end

get "/contact" do
  erb :contact, layout: :default_template
end

post "/contact" do
  EmailSender.send(params)
  "Thank you for sending email"
end
```
1.) Build a simple form that if you fill it out, it displays your personality type, such as this [3 question personality test](https://www.blogthings.com/threequestionpersonalitytest/).
