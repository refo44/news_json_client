# digg_client.rb
system("client")

require 'json'
require 'rest-client'

class DiggClient 
	attr_reader :news

	def initialize(attribute = {})	

		response = RestClient.get 'http://digg.com/api/news/popular.json'
	
		response_hash= JSON.parse(response.body)
	
	  news = response_hash["data"]["feed"]
                                   
	end
end

