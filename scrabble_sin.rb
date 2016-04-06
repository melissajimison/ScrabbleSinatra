require 'sinatra'
# require_relative 'libs/peep'

class Scrabble < Sinatra::Base
  # register Sinatra::Reloader

  get '/' do
    erb :index
  end


  get '/score' do
    erb :score
  end

  post '/score' do
    params
    # params = [word,melissa]
    erb :score

  end

  run!
end
