require 'sinatra'
require 'mandrill'

get '/' do
  erb :about
end

get '/about' do
  @title = "About"
  erb :about
end

get '/reservations' do
  @title = "Reservations"
  erb :reservations
end

get '/contact' do
  @title = "Contact"
  erb :contact
  #m = Mandrill::API.new ENV['MANDRILL_APIKEY']
  # m = Mandrill::API.new
  # message = {  :subject=> "Hello from the Mandrill API",  
  #              :from_name=> "Squirrel",  
  #              :text=>"Hi message, how are you?",  
  #              :to=>[{:email=> "pbunsee@gmail.com", :name=> "Recipient1"}],  
  #              :html=>"<html><h1>Hi <strong>message</strong>, how are you?</h1></html>",  
  #              :from_email=>"pbunsee@gmail.com" } 
  #              sending = m.messages.send message 
  #              puts sending
  # "I think we sent a message!"
end

get '/menu' do
  @title = "Menu"
  mandrill = Mandrill::API.new ENV['MANDRILL_APIKEY']
  message = {to: [{"type"  =>"to",
                   "email" =>"pbunsee@gmail.com",
                   "name"  =>"Pranesha"}],
             subject: "Let's meet for lunch!",
             from_email: 'pbunsee@gmail.com',
             text: "How does that sound" }
  erb :menu
end

post '/contact' do
  @title = "Contact Confirmation"
  @firstname = params["firstname"]
  @lastname = params["lastname"]
  @email = params["email"]
  @your_message = params["your_comments"]

  @contact_confirm_msg = "<p>Dear #{@firstname} #{@lastname},</p>"
  @contact_confirm_msg = "#{@contact_confirm_msg} <p>Thank you for your comments. We appreciate your feedback.</p>"
  @contact_confirm_msg = "#{@contact_confirm_msg} <p>Sincerely, El Born Bar</p>"
  
  img_email = "<img src='http://farm6.staticflickr.com/5225/5605922398_ff3c8cbedc_z.jpg'>"
  @contact_confirm_msg = "#{@contact_confirm_msg} <p>#{img_email}</p>"

  mandrill = Mandrill::API.new ENV['MANDRILL_APIKEY']
  message = {to: [{"type" => "to",
                 "email"  => "anitaperala@gmail.com",
                 "name"   => "Anita"}],
                 subject: "Thank you for your comments on El Born Bar",
                 from_email: 'anitaperala@gmail.com',
                 html: "#{@contact_confirm_msg}"
                }
  puts mandrill.messages.send(message)
  erb :contact_confirm
end

post '/reservations' do
  mandrill = Mandrill::API.new ENV['MANDRILL_APIKEY']
  message = {to: [{"type"  =>"to",
                   "email" =>"pbunsee@gmail.com",
                   "name"  =>"Pranesha"}],
             subject: "Let's meet for lunch!",
             from: 'pbunsee@gmail.com',
             text: "How does that sound" }

  puts mandrill.messages.send(message)

  #"I think we sent a message!"
end

