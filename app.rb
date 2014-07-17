require 'sinatra'
require 'sinatra/base'
require 'pry'
require 'json'
require 'imdb'
require_relative './PosterRetriever'

class MyApp < Sinatra::Base

	get '/' do
		erb :index
	end

	post "/search" do
		key_word=params["data"]
		list_of_urls=PosterRetriever.new.get_posters(key_word)
		list_of_urls.to_json
	end

end