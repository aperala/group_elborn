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

post '/reservation_confirm' do
  @res_date = params["res_date"]
  @res_time = params["res_time"]
  @res_number = params["res_number"]
  @firstname = params["firstname"]
  @lastname = params["lastname"]
  @email = params["email"]
  @res_contact = params["res_contact"]

  @res_confirm_msg = "<p>Your reservation at <b>Bar Del Born</b> is confirmed for <b>#{@res_time}</b> on <b>#{@res_date}</b>.</p>"

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
  @res_confirm_msg = "#{@res_confirm_msg} <td>Number of Guests</td><td><b>#{@res_number}</b></td>"
  @res_confirm_msg = "#{@res_confirm_msg} <tr>"
  @res_confirm_msg = "#{@res_confirm_msg} </tr>"
  @res_confirm_msg = "#{@res_confirm_msg} <td>First Name</td><td>#{@firstname}</td>"
  @res_confirm_msg = "#{@res_confirm_msg} </tr>"
  @res_confirm_msg = "#{@res_confirm_msg} <tr>"
  @res_confirm_msg = "#{@res_confirm_msg} <td>Last Name</td><td>#{@lastname}</td>"
  @res_confirm_msg = "#{@res_confirm_msg} </tr>"
  @res_confirm_msg = "#{@res_confirm_msg} <tr>"
  @res_confirm_msg = "#{@res_confirm_msg} <td>Contact Number</td><td>#{@res_contact}</td>"
  @res_confirm_msg = "#{@res_confirm_msg} </tr>"
  @res_confirm_msg = "#{@res_confirm_msg} </table>"

  # @res_confirm_page is displayed on the reservation_confirm.erb - sans image
  @res_confirm_page = "<div id=#{34.chr}confirmed_reservation#{34.chr}>#{@res_confirm_msg}</div>"

  # image is sent out on email only
  img_email = "<img src='https://mrandmrssmith-wpengine.netdna-ssl.com/wp-content/uploads/2013/08/ABaC.png'>"
  @res_confirm_msg = "#{@res_confirm_msg} <p>#{img_email}</p>"


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

