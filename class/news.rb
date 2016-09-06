# news.rb

class NewsElement

	attr_accessor :title, :author, :date, :url 

	def initialize (attributes={})
		@title = attributes[:title]
		@author = attributes[:author]
		@date = attributes[:date]
		@url = attributes[:url]
	  var_check  
	end

	def to_print
      
      timeprint = Time.at(@date).strftime(" %d / %m / %Y ")

		
		puts "#{timeprint}"
		puts
		puts
		puts " #{@title}"

		puts "autor: #{@author}"
		puts "url: #{@url}"
    puts
		puts " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
	end

	private

	def var_check
		# revisa si hay variables sin inicializar 
   @title ||= ""
   @author ||= ""
   @date ||= 0
   @url ||=""
	end

end 