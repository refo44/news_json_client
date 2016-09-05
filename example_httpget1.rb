system("clear")

# Necesario para hacer http requests
require 'net/http'

# Parser JSON de Ruby
require "json"

# Variables
endpoint = 'www.reddit.com'
res = "/.json"

# Forma 4
# Armamos el URI
uri = URI("http://#{endpoint}#{res}")
p uri
# Creamos un objeto (instancia) de tipo Request (en Ruby llamado Net::HTTP::Get)
my_request = Net::HTTP::Get.new(uri) # Al crear la instancia, le pasamos el URI de una vez
# Necesitamos enviar un dato en el Header del request llamado "User-Agent". Para
# esto, simplemente creamos una propiedad (dinamicamente) en el objeto Request, así:
my_request["User-Agent"] = "Juca\'s Awesome Reddit Reader"
# Iniciamos una petición con Net::HTTP pero de una 4ta forma (habíamos visto 3 antes).
# Para iniciarla, le pasamos el URI que armamos (uri.hostname). Luego, simplemente ejecutamos
# la petición propiamente dicha (con el método .request). La respuesta de la petición la
# asignamos a la variable resp.
resp = Net::HTTP.start(uri.hostname) {|http|
	# Justo aquí ejecutamos la petición
	http.request(my_request)
}

# Ya en resp tenemos la respuesta que esperamos. Ahora nos divertimos haciendole parsing a
# ese mega string que recibimos como ya bien sabemos hacerlo. Enjoy your life!

resp_hash = JSON.parse(resp.body)

puts resp_hash.class
puts resp_hash.length

reddit_news = resp_hash["data"]["children"]

puts "************************************"
puts "Cantidad de noticias obtenidas: #{reddit_news.length}"
puts "************************************"

reddit_news.each_with_index { |reddit_new, i|
	puts "#{i + 1}.- #{reddit_new['data']['title']}"
}
