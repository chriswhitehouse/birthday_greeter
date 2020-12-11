require 'sinatra/base'

class BirthdayGreeter < Sinatra::Base
  set :session_secret, 'super_secret'
  enable :sessions
  
  get '/' do
    "Hello World!"
  end

  #start the server if ruby file executed directly
  run! if app_file = $0
end
