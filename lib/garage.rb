
class Garage
	
	
	attr_reader :working_bikes
	
	def initialize
		@working_bikes = []
	end	

	def store_bikes(supplier)
		supplier.release_broken_bikes.each do |bike|
			@working_bikes << fixing(bike)
		end	
	end	

	def fixing(bike)
		bike.fix_bike
		bike
	end	
end