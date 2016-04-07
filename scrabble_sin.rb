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
    @by_letter = Scoring.letter_by_letter(params["word"])
    erb :score

  end

  get '/score_many' do
    erb :score_many
  end

  post '/score_many' do
    @multiple_scores = Scoring.score_many(params["words"].split)
    @by_letter = Scoring.letter_by_letter(params["word"])
    erb :score_many
  end

  run!
end
