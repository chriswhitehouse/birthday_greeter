require 'sinatra/base'
require 'date'

class BirthdayGreeter < Sinatra::Base
  set :session_secret, 'super secret'
  enable :sessions

  get '/' do
    erb :index
  end

  post '/name' do
    session[:name] = params[:name]
    session[:day] = params[:day]
    session[:month] = params[:month]

    if session[:day].to_i == (Date.today).day && session[:month].to_i == (Date.today).month
      redirect '/happy_birthday'
    else
      if Date.today > Date.new(Date.today.year, session[:month].to_i, session[:day].to_i)
        session[:days_notice] = Date.new(Date.today.year + 1, session[:month].to_i, session[:day].to_i) - Date.today
      else
        session[:days_notice] = Date.new(Date.today.year, session[:month].to_i, session[:day].to_i) - Date.today
      end

      redirect '/birthday_notice'
    end
  end

  get '/happy_birthday' do
    @name = session[:name]
    erb :happy_birthday
  end

  get '/birthday_notice' do
    @name = session[:name]
    @days_notice = session[:days_notice].to_i
    erb :birthday_notice
  end

  #start the server if ruby file executed directly
  run! if app_file == $0
end
