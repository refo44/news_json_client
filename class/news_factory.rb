# news_factory.rb

require_relative "news.rb"

class NewsFactory

	def initialize(requestlist)

   @requestlist = requestlist

   @newslist= {reddit:[],digg:[],mashable:[]}

   reddit_news
   #digg_news
   #mashable_news 

	end

	def reddit_news  
		@requestlist[:reddit].each do |news_post|
              
         element = NewsElement.new 

         element.title= news_post["data"]["title"]
         element.author= news_post["data"]["author"]
         element.url= news_post["data"]["url"]

         time = news_post["data"]["created"]
         element.date= time.to_i # Unix/POSIX time
        
         @newslist[:reddit] << element
		     puts
		     p @newslist[:reddit].last
		     puts 
		end
	end

	def digg_news  
		@requestlist[:digg].each do |news_post|
              
         element = NewsElement.new 

         element.title= news_post["content"]["title"]
         element.author= news_post["content"]["author"]
         element.url= news_post["content"]["url"]

         time = news_post["date"]
         element.date= time.to_i # Unix/POSIX time 
        
         @newslist[:digg] << element
		     puts
		     p @newslist[:digg].last
		     puts 
		end
	end

	def mashable_news  
		@requestlist[:mashable].each do |news_post|
              
    	element = NewsElement.new

       element.title= news_post["title"]
       element.author= news_post["author"]
       element.url= news_post["link"]

       time = Time.parse(news_post["post_date"])
       element.date= time.to_i  # Unix/POSIX time   
       
        
         @newslist[:mashable] << element
		     puts
		     p @newslist[:mashable].last
		     puts 
		end
	end


end