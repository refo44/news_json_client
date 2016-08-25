=begin
Author: Daniel Castrillo
Project: Classroom
Description: main program of the Classroom project

{hack}
Instructor: Romer

=end

require "colorize"
require_relative "./lib.rb"
require_relative "./classroom.rb"
require_relative "./school.rb"

def main(school)
	while true
	    if welcome_menu() == 1 then
	    	while school_menu(school) != 5
		      	if school_menu(school) == 1 then
		      		system ("clear")
		      		if school == nil
		      			print 	"\n\tThere are no classrooms at the moment".colorize(:red) +
		      					"\n\tPlease add a new classroom first\n\t(press enter)".colorize(:red)
		      			gets
		      			school_menu(school)
		      		else
			      		puts "\n\tEnter the classroom ID".colorize(:green)
			      		print "\t"
			      		target = gets.chomp.to_i
			      		classroom = (school.select {|classroom| classroom.class_id == target})[0]
			      		if classroom
			      			while classroom_menu(classroom) != 5
			      				if classroom_menu(classroom) == 1
			      					classroom.add_student!
			      				elsif classroom_menu(classroom) == 2
			      					classroom.edit_student!
			      				elsif classroom_menu(classroom) == 3
			      					classroom.delete_student!
			      				elsif classroom_menu(classroom) == 4	
			      					classroom.order_students_by!
			    				end
			    			end	
			    		else
			    			puts "\tNo classrooms with that ID"
			    			print "\t(press enter to continue)"
			    			gets	      					
		      			end
		      		end
		      	elsif school_menu(school) == 2 then
		      		add_classroom!(school)
		      	elsif school_menu(school) == 3 then
		      		edit_classroom!(school)	      		
		      	elsif school_menu(school) == 4 then
		      		delete_classroom!(school)	    
		      	end
		    end
	    elsif welcome_menu() == 2 then
	    	students_print(school)
	    elsif welcome_menu() == 3 then
	    	abort("\n\tThank you for stopping by\n\n\t\t0    0\n\t\t______\n\n")
	    end	
	end
end

main($school)