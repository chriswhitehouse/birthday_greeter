# birthday_greeter
A small web app to calculate how many days to next birthday.

## Motivation
An opportunity to build a small web app unguided. Building understanding an of web frameworks, server-client request response cycles, routing, and simple html driven by erb.

## Build status
Working but needs refactoring and styling.

## Screenshots
Include logo/demo screenshot etc.

## Tech/framework used
Ruby, Sinatra, & Rspec with Capybara for feature tests.

## Features
Test it in your birthday!

## Code Example
```ruby
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
```

## Installation
For repo. Run `bundle` in the terminal.

## Tests

* When I land on the home page I want to be greeted
* When I land on the home page I want to be wished happy
* When I land on the home page I want to be told 65 days to my birthday
* When I land on the home page I want to told 300 days to my birthday

## How to use?
run `rackup` in your terminal from the project folder. Visit the 'localhost:' with port number in your browser.
