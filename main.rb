# main.rb
require_relative "class/api_client.rb"
require_relative "class/news_factory.rb"

json_request = ApiClient.new

 NewsFactory.new(json_request.news)

