class Bike

	attr_reader :working

	def initialize(working = true)
		@working = working
	end	

	def working?
		if @working == true
			true
		else
			false
		end
	end

	def break_bike
		@working = false
	end	

end

# myBici = Bike.new
# myBici.working?  #false

# tuBici = Bike.new(true)
# myBici.working?  #true



