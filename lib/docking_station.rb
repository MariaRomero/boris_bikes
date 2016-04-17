#require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bike_array
  attr_reader :capacity


   def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bike_array = []

   end

  def release_bike
    fail 'No bikes available' if @bike_array.empty?
    releasing_bike = @bike_array.last
      if releasing_bike.working? == false
        fail "Sorry This bike is not working"
      else  
        @bike_array.pop
      end 
  end

   def report(bike)
     bike.broken = true
   end

  def dock(bike)
    fail 'Dock is full' if full?
      if bike.working?
        @bike_array << bike
      else
        @bike_array.unshift(bike)
      end
  end  

  def return_broken_bikes
    rtn_broken_bikes = []
    counter = 0 
    while counter < @bike_array.length do
        if @bike_array[counter].working? == false
          rtn_broken_bikes << @bike_array[counter]
        end  
      counter +=1
    end 
    rtn_broken_bikes
  end  

#private

  def empty?
    if @bike_array.empty?
      true
     else
      false
     end
  end

  def full?
    if @bike_array.count >= @capacity
      true
    else
      false
    end
  end

  # Original code which passed original test
  # def release_bike
  #   if @bike
  #      fail "Bike already exists"
  #    else
  #      @bike = Bike.new
  #  end
  # end

  #Our code which passed
  # def dock(docked_bike)
  #   if @bike
  #     fail "Dock already full"
  #   else
  #     @bike = docked_bike
  #   end
  # end

end
