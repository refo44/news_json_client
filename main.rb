# main.rb
require_relative "class/api_client.rb"
require_relative "class/news_factory.rb" 
require_relative "class/menu.rb"


def main

	json_request = ApiClient.new	

	factory = NewsFactory.new(json_request.news)	

	

	Menu.new(lista: factory.newslist)

end

main

