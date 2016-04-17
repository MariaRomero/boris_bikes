
require_relative 'bikecontainer'

class Van
	
	attr_reader :broken_bikes
	attr_reader :working_bikes

	def initialize
		@broken_bikes = []
		@working_bikes = []
	end	

	def store_bikes(bike)
		if bike.working? 
			@working_bikes << bike
		else
			@broken_bikes << bike
		end				
	end

	def sorts_broken_bikes(supplier)
		supplier.return_broken_bikes.each do |bike|
			@broken_bikes << bike  
		end	
	end	

	def releases_broken_bikes
		garage_broken_b = []
		
		@broken_bikes.each do |bike|
			garage_broken_b << bike 
			@broken_bikes.shift
		end	
		garage_broken_b
	end
	
	def releases_working_bikes	
		garage_working_b = []

		@working_bikes.each do |bike|
			garage_working_b << bike
			@working_bikes.shift
		end
		garage_working_b
	end	

end

