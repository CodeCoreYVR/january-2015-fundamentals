require "sinatra"
require "pony"
require "data_mapper"

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/sinatra.db")

# data mapper will create a table called contacts
# for this class
class Contact
  include DataMapper::Resource

  property :id,        Serial
  property :full_name, String
  property :email,     String
  property :message,   Text

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
  @contacts = Contact.all
  erb :all_contacts, layout: :default
end

get "/contact" do
  erb :contact, layout: :default
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
