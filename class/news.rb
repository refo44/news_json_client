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

	private

	def var_check
		# revisa si hay variables sin inicializar 
   @title ||= ""
   @author ||= ""
   @date ||= 0
   @url ||=""
	end

end 