require 'sinatra'

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
  erb :reservation_confirm
end

