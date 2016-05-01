$:.unshift File.expand_path("../", __FILE__)

require './scrabble_sin'

run Sinatra::Application
