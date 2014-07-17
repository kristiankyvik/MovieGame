
class IMDBSearcher

	def initialize (api) #pasa el api:search
		@api=api
	end

	def get_array_movies (query)
		@api.new(query).movies
	end

end