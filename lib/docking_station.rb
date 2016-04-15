require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :bike_array
  attr_reader :capacity


   def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bike_array = []
   end

  def release_bike
    fail 'No bikes available' if self.empty?
    bike_to_release = @bike_array.pop
    if bike_to_release.working? == false
      fail 'This bike is broken, please try again'
    else
      return bike_to_release
    end
  end

   def report(bike)
     bike.broken = true
   end

  def dock(bike)
    fail 'Docking station full' if self.full?
     @bike_array <<  bike
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
