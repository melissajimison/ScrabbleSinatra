require 'sinatra'
require_relative 'libs/scorecode'
require_relative 'libs/points'

class Scrabble < Sinatra::Base
  # register Sinatra::Reloader

  get '/' do
    erb :index
  end

  get '/score' do
    erb :score
  end

  post '/score' do
    if  params["word"][/\d+/] == nil
    @points = Scoring.score(params["word"])
    @by_letter = Scoring.letter_by_letter(params["word"])
    else
      "nothing hapend"
    end
    erb :score
  end

  get '/score_many' do
    erb :score_many
  end

  post '/score_many' do
    @multiple_scores = Scoring.score_many(params["words"].split)
    @score_weight = params["scoreweight"]
    @by_letter_many = Scoring.letter_by_letter_many(params["words"].split)
    erb :score_many
  end

  run!
end
