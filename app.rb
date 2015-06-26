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
end

get '/menu' do
  @title = "Menu"
  erb :menu
end

post '/contact' do
  @title = "Contact Confirmation"
  erb :contact_confirm
end

post '/reservations' do
  @title = "Reservation Confirmation"

  mandrill = Mandrill::API.new ENV['MANDRILL_APIKEY']
  message = {  
  :subject=> "Hello from the Mandrill API",  
  :from_name=> "Your name",  
  :text=>"Hi message, how are you?",  
  :to=>[{:email=> "recipient@theirdomain.com", :name=> "Recipient1"}],  
  :html=>"<html><h1>Hi <strong>message</strong>, how are you?</h1></html>",  
  :from_email=>"sender@yourdomain.com" } 
  sending = m.messages.send message 
  puts sending

  erb :reservation_confirm
end

