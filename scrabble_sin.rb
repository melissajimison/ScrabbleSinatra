require 'sinatra'
require_relative 'libs/scorecode'

class Scrabble < Sinatra::Base
  # register Sinatra::Reloader

  get '/' do
    erb :index
  end


  get '/score' do
    erb :score
  end

  post '/score' do
    @points = Scoring.score(params["word"])
    # params
    # params = [word,melissa]
    erb :score

  end

  run!
end
