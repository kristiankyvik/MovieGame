
require './PosterRetriever'

describe "the poster retrieval" do
	before :each do
		@movie_db=double("movie database")
		@poster_retriever = PosterRetriever.new(@movie_db)
	end


	it "must retrieve one poster if we only have one poster" do
		@movie_db.stub(:posters).and_return(["www.url.com"]) # => movie_db.posters -> ["www.url.com"]
		expect(@poster_retriever.get_posters("query")).to eq(["www.url.com"])

	end

	it "retrieves two posters if they are two" do
		@movie_db.stub(:posters).and_return(["www.url.com", "www.url.com" ])
		expect(@poster_retriever.get_posters("query")).to eq(["www.url.com", "www.url.com" ])
	end

	it "removes the nil urls" do
		@movie_db.stub(:posters).and_return([nil, "www.url.com"])
		expect(@poster_retriever.get_posters("query")).to eq(["www.url.com"])
	end

	it "return nine posters if enough and all of them have posters" do
		@movie_db.stub(:posters).and_return(["www.url.com"]*10)
		expect(@poster_retriever.get_posters("query")).to eq(["www.url.com"]*9)
	end

	it "return nine posters if enough and all of them have posters" do
		@movie_db.stub(:posters).and_return([nil]+["www.url.com"]*9)
		expect(@poster_retriever.get_posters("query")).to eq(["www.url.com"]*9)
	end



end

