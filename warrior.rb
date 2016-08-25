=begin
Author: Promo 6 Hack
Project: Classroom
Description: Implementation of Warrior class

{hack}
Mentor: Carlos
=end

require_relative "./person.rb"

class Warrior < Person

	def initialize(attr={})
		@weapons = attr[:weapons]
		super 
		talking_to_god
	end
end