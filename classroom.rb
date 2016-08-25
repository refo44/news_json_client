=begin
Author: Daniel Castrillo
Project: Classroom
Description: Implementation of Classroom class

{hack}

=end

class Classroom

	#attr_writer
	attr_reader :students, :class_id
	attr_accessor :teacher

	@@students_id = 25
	@@classroom_id = 1

	def initialize(attr={})
		@teacher = attr[:teacher]
		@students = attr[:students]
		@class_id = @@classroom_id
		classroom_counter
		var_checker
	end

	def print_student(id)
		@students.each do |student| 
			if student[:id] == id
				puts "" +
					"Name: #{student[:name]}\n" +
					"Last Name: #{student[:last_name]}\n" +
					"Address: #{student[:address]}\n" +
					"Phone Number: #{student[:phone_num]}\n" +
					"E-Mail: #{student[:email]}"
			end
		end
	end

	def print_classroom
		print "\tClass ID: #{@class_id}\tTeacher: #{@teacher}\n"
		if @students.length == 0
			puts "\n\tNo students in this classroom"
		else
			puts "\t\nStudents:"
			@students.each do |student| 
				puts "\n" +
					"\tID: #{student[:id]}\n" +
					"\tName: #{student[:name]}\n" +
					"\tLast Name: #{student[:last_name]}\n" +
					"\tAddress: #{student[:address]}\n" +
					"\tPhone Number: #{student[:phone_num]}\n" +
					"\tE-Mail: #{student[:email]}"
			end
		end
	end

	def add_student!
		student_counter
		id = @@students_id
		print "\n\tEnter the name of the student: "
		name = gets.chomp
		print "\tEnter the last name of the student: "
		last_name = gets.chomp
		print "\tEnter the address of the student: "
		address = gets.chomp
		print "\tEnter the phone number of the student: "
		phone = gets.chomp
		print "\tEnter the students E-Mail: "
		email = gets.chomp

		@students << {
			id: id,
			name: name,
			last_name: last_name,
			address: address,
			phone_num: phone,
			email: email
		}
	end

	def edit_student!
		puts "\n\tEnter the ID of the student to be edited".colorize(:green)
		print "\t"	
		target = gets.chomp.to_i
		puts ""
		print_student(target)
		student = (@students.select{|student| student[:id] == target})[0]
		puts ""
		answer = 0
		while answer != 6
			answer = 0
			loop do
			    print 	"\n\tWhat do you wish to change?\n" +
						"\n\tName (press 1)\n" +
			    		"\tLast Name (press 2)\n" +
			    		"\tAddress (press 3)\n" +
			    		"\tPhone Number (press 4)\n" +
			    		"\tE-Mail (press 5)\n" +
			    		"\tGo Back (press 6)\n" +
			    		"\t>>"
				system("stty raw -echo")
			    answer = STDIN.getc.to_i
			    system("stty -raw echo")
			    puts "#{answer}"
			    break if answer > 0 && answer < 7
			    print "\n\tThat's not an option in the MENU, please chose again.\n\t(press enter)".colorize(:red)
			    gets
		  	end
		  	system("clear")
		  	options = ["name","last_name","address","phone_num","email"]
		  	index = answer - 1
		  	var = options[index]
		  	if answer < 6
				print "\n\tEnter new value\n\t".colorize(:green)
				@students.map do |stdnt|
					if student == stdnt
						stdnt[var.to_sym] = gets.chomp
						print_student(target)
					end
				end
			end
		end
	end

	def delete_student!
		puts "\n\tEnter the ID of the student to be deleted".colorize(:green)
		print "\t"	
		target = gets.chomp
		@students.each do |students| 
			if students[:id] == target
				puts "\n\t Student: #{students[:name]} #{students[:last_name]} is being deleted form classroom"
			end
		end
		@students.delete_if!{|student| student[:id] == target}
		#@students.map do |students|
			#if students[:id] > target
				#students[:id] = students[:id] - 1
			#end
		#end
	end

	def order_students_by!
		answer = 0
		while answer != 6
			print_classroom
			answer = 0
			var = ""
			loop do
			    print 	"\n\tSelect the filter to sort the students\n" +
						"\n\tName (press 1)\n" +
			    		"\tLast Name (press 2)\n" +
			    		"\tAddress (press 3)\n" +
			    		"\tPhone Number (press 4)\n" +
			    		"\tE-Mail (press 5)\n" +
			    		"\tGo Back (press 6)\n" +
			    		"\t>>"
				system("stty raw -echo")
			    answer = STDIN.getc.to_i
			    system("stty -raw echo")
			    puts "#{answer}"
			    break if answer > 0 && answer < 7
			    print "\n\tThat's not an option in the MENU, please chose again.\n\t(press enter)".colorize(:red)
			    gets
		  	end
		  	system("clear")
		  	options = ["name","last_name","address","phone_num","email"]
		  	index = answer - 1
		  	var = options[index]
		  	if answer < 6
				@students.sort_by! do |students|
					students[var.to_sym]
				end
			end
		end	
	end

	private
	def classroom_counter
		@@classroom_id += 1
	end

	def student_counter
		@@students_id += 1
	end

	def var_checker
		if @teacher == nil
			@teacher = ""
		end
		if @students == nil
			@students = []
		end
	end
end