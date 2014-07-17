require 'imdb'

class IMDBWrapper
	def posters(query)
		Imdb::Search.new(query).movies.map { |mov| mov.poster  }
	end

end


class PosterRetriever
	def initialize(movie_db=IMDBWrapper.new)
		@movie_db=movie_db

	end	

	def get_posters(query)
		@movie_db.posters(query).compact.take(9)
	end

end
