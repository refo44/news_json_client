# menu.rb

class Menu

	def initialize(attribute={})  
	    @lista= attribute[:lista]   
		main_menu
	end

	def main_menu

		loop do		
			system("clear")
		
		 	puts "Seleccione una opcion: \n\n"	
			puts "1.- Mostrar noticias por sitio web \n\n"
			puts "2.- Mostrar noticias ordenadas por fecha de publicación \n\n"
			puts "S.- salir del programa"

  		op = self.get_keypressed

  		case
 			when op == "1"  
 				search_by_website

     	when op == "2" then 
         show_big_list
      when op.downcase == "s" then

     		system("clear")

     		puts
     		puts "¡Hasta luego!" 
     		puts 
     		sleep 0.8
     		system("clear")
   		end
  		break if op.downcase == "s"
    end
	end

	def search_by_website
    ans||=0
		loop do		
			system("clear")		
		 	puts "Seleccione un sitio web: \n\n"	
			puts "1.- reddit \n\n"
			puts "2.- digg \n\n"
			puts "3.- mashable\n\n"
      ans = get_keypressed.to_i    
			break if (1..3).include?(ans)
		end
		opcion = ["reddit","digg","mashable"]
       tag_list = opcion[ans-1]
       show_list(tag_list)
	end

	def show_list(tag_list)
		key_list=tag_list.to_sym

		@lista[key_list].each do |post|
			puts 
      puts "   from: #{tag_list}   "
      post.to_print
 
		end
     get_keypressed
	end

	def show_big_list
     
     @big_list = []

     @lista[:reddit].each{|element| @big_list << element}
     @lista[:digg].each{|element| @big_list << element}
     @lista[:mashable].each{|element| @big_list << element}

     @big_list.sort_by!{|element| element.date}

     @big_list.each do |post|

      puts 
      puts "    all post ordered by time  "
      post.to_print
 
		end
     get_keypressed


	end

	def get_keypressed
	# Lee la tecla pulsada desde el terminal sin presionar Enter
	  system('stty raw -echo')
	  t = STDIN.getc
	  system('stty -raw echo')
	  return t
	end
end



