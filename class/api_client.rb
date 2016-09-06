# api_client.rb

require 'json'
require 'rest-client'

class ApiClient
	attr_reader :news

	def initialize(attribute = { })	
  	@news = {reddit:[],digg:[],mashable:[]}

    request_reddit
    request_digg 
    request_mashable
	end

	def request_reddit
		@url = 'https://www.reddit.com/.json'

		puts
		print "requesting reddit... "

		request_json
    @response_hash["data"]["children"].each { |element| @news[:reddit] << element}	

    print "OK"
    puts
	end

	def request_digg
		@url = 'http://digg.com/api/news/popular.json'

		puts
		print "requesting digg... "

		request_json
    @response_hash["data"]["feed"].each { |element| @news[:digg] << element}
		print "OK"
    puts
	end

	def request_mashable
		#Mashable ofrece tres secciones separadas de noticias que en esta función se agrupan en una sola
		@url = 'http://mashable.com/stories.json'
    
    puts
		print "requesting mashable... "

		request_json 

  	@response_hash["new"].each { |element| @news[:mashable] << element}
    @response_hash["rising"].each { |element| @news[:mashable] << element}
    @response_hash["hot"].each { |element| @news[:mashable] << element}
		print "OK"
    puts
	end

	private	

	def request_json
  # Reddit solicita definir un User-Agent con un formato específico para no limitar el numero de consultas que se pueden realizar, dicho parametro es considerado irrelevante en el caso de las API de Digg y Mashable

		response = RestClient.get @url, { user_agent: "	User-Agent: refo_news_reader:v0.2.0 (by /u/<reddit refo44>)"}

		@response_hash = JSON.parse(response.body)

	end
end
