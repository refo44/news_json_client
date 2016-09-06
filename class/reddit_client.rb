system("client")

require 'json'
require 'rest-client'

class RedditClient
	attr_reader :news

	def initialize(attribute = {})	

		response = RestClient.get 'https://www.reddit.com/.json', { user_agent: "	User-Agent: refo_news_reader:v0.2.0 (by /u/<reddit refo44>)"}
	
		response_hash= JSON.parse(response.body)
	
	  news = response_hash["data"]["children"]	                                      
	end
end

