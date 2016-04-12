#require './lib/bike'

class DockingStation
  attr_reader :bike_array
  attr_reader :bike

  def initialize
    @bike_array = []
  end

	def release_bike
    fail 'No bikes available' if @bike_array.empty?
    @bike_array.pop
	end

	def dock(bike)
		fail 'Dock is full' if @bike_array.count >= 20
    @bike_array << bike
    bike
  end



end
