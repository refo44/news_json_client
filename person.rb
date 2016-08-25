=begin
Author: Promo 6 Hack
Project: Classroom
Description: Implementation of Person class

{hack}
Mentor: Carlos
=end

class Person
	@@persons = []
	#attr_writer 
	attr_reader :name, :last_name
	attr_accessor :age, :weight, :height

	def self.all
		@@persons.each do |person|
			puts "#{person.name}"
		end
	end

	def initialize(attr={})
		@name = attr[:name]
		@last_name = attr[:last_name]
		@age = attr[:age]
		@weight = attr[:weight]
		@height = attr[:height]
		@@persons << self
	end

	def eat
		@weight += 1
	end

	def grow
		@age += 1
		@height += 2
	end

	def run
		@weight -= 1
	end

	private
	def talking_to_god
		puts "hola dios"
	end
end

