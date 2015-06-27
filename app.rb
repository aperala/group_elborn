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

  # puts mandrill.messages.send(message)

  # "I think we sent a message!"
  erb :menu
end

post '/contact' do
  @title = "Contact Confirmation"
  @your_message = params["your_comments"]
  erb :contact_confirm
end

post '/reservation_confirm' do
  @res_date = params["res_date"]
  @res_time = params["res_time"]
  @res_number = params["res_number"]
  @firstname = params["firstname"]
  @lastname = params["lastname"]
  @email = params["email"]
  @res_contact = params["res_contact"]

  @res_confirm_msg = "<p>Your reservation at El Born is confirmed for <b>#{@res_time}</b> on <b>#{@res_date}</b>.</p>"

  @res_confirm_msg = "#{@res_confirm_msg} <table>"
  @res_confirm_msg = "#{@res_confirm_msg} <th>"
  @res_confirm_msg = "#{@res_confirm_msg} <b>Reservation Confirmation</b>"
  @res_confirm_msg = "#{@res_confirm_msg} </th>"
  @res_confirm_msg = "#{@res_confirm_msg} <tr>"
  @res_confirm_msg = "#{@res_confirm_msg} <td>Reservation Date</td><td><b>#{@res_date}</b></td>"
  @res_confirm_msg = "#{@res_confirm_msg} </tr>"
  @res_confirm_msg = "#{@res_confirm_msg} <tr>"
  @res_confirm_msg = "#{@res_confirm_msg} <td>Time</td><td><b>#{@res_time}</b></td>"
  @res_confirm_msg = "#{@res_confirm_msg} </tr>"
  @res_confirm_msg = "#{@res_confirm_msg} <tr>"
  @res_confirm_msg = "#{@res_confirm_msg} <td>Number of Guests</td><td>#{@res_number}</td>"
  @res_confirm_msg = "#{@res_confirm_msg} <tr>"
  @res_confirm_msg = "#{@res_confirm_msg} </tr>"
  @res_confirm_msg = "#{@res_confirm_msg} <td>First Name</td><td>#{@firstname}</td>"
  @res_confirm_msg = "#{@res_confirm_msg} </tr>"
  @res_confirm_msg = "#{@res_confirm_msg} <tr>"
  @res_confirm_msg = "#{@res_confirm_msg} <td>Last Name</td><td>#{@lastname}</td>"
  @res_confirm_msg = "#{@res_confirm_msg} </tr>"
  @res_confirm_msg = "#{@res_confirm_msg} <tr>"
  @res_confirm_msg = "#{@res_confirm_msg} <td>Email</td><td>#{@email}</td>"
  @res_confirm_msg = "#{@res_confirm_msg} </tr>"
  @res_confirm_msg = "#{@res_confirm_msg} <tr>"
  @res_confirm_msg = "#{@res_confirm_msg} <td>Contact Number</td><td>#{@res_contact}</td>"
  @res_confirm_msg = "#{@res_confirm_msg} </tr>"
  @res_confirm_msg = "#{@res_confirm_msg} </table>"

  img_email = "<img src='https://mrandmrssmith-wpengine.netdna-ssl.com/wp-content/uploads/2013/08/ABaC.png'>"
  @res_confirm_msg = "#{@res_confirm_msg} <p>#{img_email}</p>"

  #<img src="http://photosite.com/image.jpg" alt="My image" />
  #https://mrandmrssmith-wpengine.netdna-ssl.com/wp-content/uploads/2013/08/ABaC.png

                   #"name"  =>"#{@firstname}" }],

  mandrill = Mandrill::API.new ENV['MANDRILL_APIKEY']
  message = {to: [{"type"  =>"to",
                   "email" =>"pbunsee@gmail.com",
                   "name"  =>"Pranesha" }],
             subject: "Reservation at El Born on #{@res_date} at #{@res_time} for #{@res_number} guests",
             from_email: 'pbunsee@gmail.com',
             html: "#{@res_confirm_msg}" 
            }

  puts mandrill.messages.send(message)

  erb :reservation_confirm
end

