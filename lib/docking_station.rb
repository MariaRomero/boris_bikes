#require './lib/bike'

class DockingStation

  DEFAULT_CAPACITY = 20
  attr_reader :capacity
  attr_reader :bike_array  #you need this because you have you class attribute bike_array and you need to access it, other solution will be having a method that returns it and another that writes to it, but this is way easier and more elegant.
  attr_reader :bike   #you dont need this here as far as I know. Becasue this is the dock class and he does not care about bikes he does not produce them.

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bike_array = []   #as soon as a new instance gets created, this method runs and you get a fresh brand new array for free
  end

	def release_bike
    fail 'No bikes available' if @bike_array.empty?
    @bike_array.pop
	end

	def dock(bike)
		fail 'Dock is full' if full?
    @bike_array << bike
    bike
  end

  #private
  
  def full?
    if @bike_array.length >= DEFAULT_CAPACITY
      true
    else
      false
    end 
  end

  def empty?
    if @bike_array.length == 0
      true
    else
      false
    end   
  end 

end  