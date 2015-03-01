require "sinatra"
require "pony"
require "data_mapper"

enable :sessions

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/sinatra.db")

# data mapper will create a table called contacts
# for this class
class Contact
  include DataMapper::Resource

  property :id,        Serial
  property :full_name, String
  property :email,     String
  property :message,   Text
  property :note,      Text

end

helpers do
  def protected!
    return if authorized?
    headers['WWW-Authenticate'] = 'Basic realm="Restricted Area"'
    halt 401, "Not authorized\n"
  end

  def authorized?
    @auth ||=  Rack::Auth::Basic::Request.new(request.env)
    @auth.provided? and @auth.basic? and @auth.credentials and @auth.credentials == ['admin', 'admin']
  end
end

# create the table in the database if it doesn't exist
# If the table exists then it will add the columns that
# don't exist
Contact.auto_upgrade!

get "/" do
  @name = params[:name]
  erb :index, layout: :default
end

get "/about" do
  "This is my first Sinatra application"
end

get "/all_contacts" do
  protected!
  @contacts = Contact.all
  erb :all_contacts, layout: :default
end

get "/contact" do
  erb :contact, layout: :default
end

# This will match any url that has something after the /
# for example: /contact/1 or /contact/abc
get "/contact/:id" do |id|
  protected!
  # this will issue a query like:
  # SELECT * FROM contacts WHERE id=4;
  @contact = Contact.get id

  session[:last_visited_contact] = @contact.full_name

  # this renders the signle_contact.erb
  # within the "default" layout
  erb :single_contact, layout: :default
end

post "/note/:id" do |id|
  protected!
  contact      = Contact.get id
  contact.note = params[:note]
  contact.save
  redirect to("/contact/#{contact.id}")
end

get "/color/:color" do |color|
  session[:bg_color] = color
  redirect back
end

post "/contact" do
  Contact.create(full_name: params[:full_name],
                 message:   params[:message],
                 email:     params[:email])

  Pony.mail({
      to: "tam@codecore.ca",
      from: params[:email],
      subject: "#{params[:full_name]} just contacted you",
      body: params[:message],
      via: :smtp,
      via_options: {
        address: "smtp.gmail.com",
        port: "587",
        enable_starttls_auto: true,
        user_name: "answerawesome",
        password: "Sup3r$ecret",
        authentication: :plain,
        domain: "localhost"
      }
    })
  params.to_s
end
