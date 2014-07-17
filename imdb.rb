require 'sinatra'
require 'imdb'
require 'pry'

class IMDB

	def search(movie_name)
		movies=Imdb::Search.new(movie_name)
		binding.pry
		movies.size
	end
end

search=IMDB.new().search("Lord of the rings")