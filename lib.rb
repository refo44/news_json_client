=begin
Author: Daniel Castrillo
Project: Classroom
Description: function library for Classroom

{hack}
Instructor: Romer

=end

require "colorize"

def welcome_menu()
  answer = 0
  loop do
    system ("clear")
    print "\n\tWelcome to *Classroom*\n\tan interface for classroom data\n"
    print "\n\tMENU:\n\t1.- Classrooms (press 1)\n\t2.- Students (press 2)\n\t3.- Exit (press 3)"
    print "\n\t>> "
    system("stty raw -echo")
    answer = STDIN.getc.to_i
    system("stty -raw echo")
    puts "#{answer}"
    break if answer > 0 && answer < 4
    print "\n\tThat's not an option in the MENU, please chose again.\n\t(press enter)".colorize(:red)
    gets
  end
  system ("clear")
  return answer
end

def school_menu(school)
  answer = 0
  loop do
    system ("clear")
   	print_school(school)
    print 	"\n" +
    		"\tMENU:\n" +
    		"\t1.- View Classroom (press 1)\n" +
    		"\t2.- Add Classroom to School (press 2)\n" +
    		"\t3.- Edit Classroom Teacher (press 3)\n" +
    		"\t4.- Delete Classroom from School (press 4)\n" +
    		"\t5.- Exit (press 5)" +
   			"\n\t>> "
    system("stty raw -echo")
    answer = STDIN.getc.to_i
    system("stty -raw echo")
    puts "#{answer}"
    break if answer > 0 && answer < 6
    print "\n\tThat's not an option in the MENU, please chose again.\n\t(press enter)".colorize(:red)
    gets
  end
  system ("clear")
  return answer
end

def classroom_menu(classroom)
  answer = 0
  loop do
    system ("clear")
   	classroom.print_classroom
    print 	"\n" +
    		"\tMENU:\n" +
    		"\t1.- Add Student (press 1)\n" +
    		"\t2.- Edit Student (press 2)\n" +
    		"\t3.- Delete Student (press 3)\n" +
    		"\t4.- Order by (press 4)\n" +
    		"\t5.- Exit (press 5)\n" +
   			"\n\t>> "
    system("stty raw -echo")
    answer = STDIN.getc.to_i
    system("stty -raw echo")
    puts "#{answer}"
    break if answer > 0 && answer < 6
    print "\n\tThat's not an option in the MENU, please chose again.\n\t(press enter)".colorize(:red)
    gets
  end
  system ("clear")
  return answer
end

def edit_classroom!(school)
	puts "\n\tEnter the ID of the classroom to be edited".colorize(:green)
	print "\t"	
	target = gets.chomp.to_i
	classroom = (school.select{|classroom| classroom.class_id == target})[0]
	puts ""
	if classroom
		classroom.print_classroom
		puts ""
		puts "\n\tName of the new teacher".colorize(:green)
		print "\t"	
		teacher = gets.chomp
		classroom.teacher = teacher.colorize(:yellow)
		puts "\n\tClassroom teacher changed".colorize(:green)
		print "\t"	
		classroom.print_classroom
		print "\n\t(press enter to go back to the school menu)"
		gets
	else
		puts "\tNo classrooms with that ID"
		print "\t(press enter to continue)"
		gets	 
	end
end

def delete_classroom!(school)
	puts "\n\tEnter the ID of the classroom to be deleted".colorize(:green)
	print "\t"	
	target = gets.chomp.to_i
	checker = school.length
	school.delete_if{|classroom| classroom.class_id == target}
	puts "\n\t Classroom #{target}"
	if checker > school.length
		puts "The classroom #{target} was deleted"
		print_school(school)
	else
		puts "No classrooms were found with that ID"
		print_school(school)
	end
	#school.map do |classroom|
		#if classroom.class_id > target
			#classroom.class_id = classroom.class_id - 1
		#end
	#end
end

def add_classroom!(school)
	puts "\n\tEnter the name of the teacher".colorize(:green)
	print "\t"
	teacher = gets.chomp
	school << Classroom.new(teacher: teacher, students: [])
end

def print_school(school)
	school.each do |classroom|
	print "" + 
		"Class ID: #{classroom.class_id}\tTeacher: #{classroom.teacher}\n" +
		"No. Students: #{classroom.students.length}\n\n"
	end
end

def students_print(school)
	school.each do |classrooms|
		classrooms.students.each do |student|
			puts "" +
				"Name: #{student[:name]}\n" +
				"Last Name: #{student[:last_name]}\n" +
				"Address: #{student[:address]}\n" +
				"Phone Number: #{student[:phone_num]}\n" +
				"E-Mail: #{student[:email]}\n" +
				"\n"
		end
	end
	student_search(school)
end

def student_search(school)
	search = []
	answer = 0
	while answer != 2
		answer = 0
		loop do
		    print 	"\n" +
		    		"\tSearch student (press 1)\n" +
		    		"\tExit (press 2)\n" +
		    		"\t>>"
			system("stty raw -echo")
		    answer = STDIN.getc.to_i
		    system("stty -raw echo")
		    puts "#{answer}"
		    break if answer > 0 && answer < 3
		    print "\n\tThat's not an option in the MENU, please chose again.\n\t(press enter)".colorize(:red)
		    gets
	  	end
	  	if answer == 1
	  		system("clear")
	  		print 	"\n\tEnter a parameter to search for\n" +
	  		 		"\t(The searcher will only find exact data): "
	  		target = gets.chomp
	  		school.each do |classrooms|
	  			search = classrooms.students.select do |students|
	  				students[:name] == target || 
	  				students[:last_name] == target ||
	  				students[:address] == target ||
	  				students[:phone_num] == target ||
	  				students[:email] == target
	  			end
	  		end
			search.each do |student|
				puts "\n" +
					"Name: #{student[:name]}\n" +
					"Last Name: #{student[:last_name]}\n" +
					"Address: #{student[:address]}\n" +
					"Phone Number: #{student[:phone_num]}\n" +
					"E-Mail: #{student[:email]}\n" +
					"\n"
			end	  		
	  	end
	end
end



