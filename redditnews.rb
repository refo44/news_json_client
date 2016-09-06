system("clear")

require 'net/http'
require 'json' 

system('clear')

uri = URI('https://www.reddit.com/.json')

#params = {limit: 1}  # incluimos mediante hash parametros en el query 
#uri.query = URI.encode_www_form(params)

my_request = Net::HTTP::Get.new(uri)
my_request["User-Agent"] = "refo_news_reader:v0.1.0 (by /u/<reddit refo44>)" #Especificamos un "User-Agent"

resp = Net::HTTP.start(uri.hostname) {|http|        
	http.request(my_request)
}

resp_hash = JSON.parse(resp.body)  #if resp.is_a?(Net::HTTPSuccess)

puts resp_hash.class
puts resp_hash.length  

reddit_news = resp_hash["data"]["children"]

puts "************************************"
puts "Cantidad de noticias obtenidas: #{reddit_news.length}"
puts "************************************"

reddit_news.each_with_index { |reddit_new, i|
	puts "#{i + 1}.- #{reddit_new['data']['title']}"
}

puts

puts

  p reddit_news.first["data"]["author"]