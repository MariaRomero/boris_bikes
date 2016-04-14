require "docking_station"  
require "bike"				

describe DockingStation do
	#DEFAULT_CAPACITY = 20
	
	describe "method full?" do
		it "returns false if less than 20 bikes are docked" do
			expect(subject.full?).to eq false	
		end	

		it "returns true if more than 20 bikes are docked" do
				DockingStation::DEFAULT_CAPACITY.times do 
				subject.dock(Bike.new)
			end 
			expect(subject.full?).to eq true
		end
	end

	describe "method empty?" do
		it "returns true when dock is empty" do
			expect(subject.empty?).to eq true
		end

		it "returns false when dock is not empty" do
			subject.dock(Bike.new)
			expect(subject.empty?).to eq false
		end
	end	

	it "working bike" do
		new_bike = Bike.new
		new_bike.working?.should be true
	end


	it "returns docked bikes" do  
		bike = Bike.new 	 
		subject.dock(bike)	 
		expect(subject.bike_array.length).to eq 1    
	end

	it "docks a bike" do   
		bike = Bike.new  
		expect(subject.dock(bike)).to eq bike 
		subject.dock(bike);
		expect(subject.bike_array[0]).to eq bike   
	end

	it 'raises an error when dock is full' do
		DockingStation::DEFAULT_CAPACITY.times do
		subject.dock Bike.new
		end 
			expect {subject.dock Bike.new}.to raise_error 'Dock is full'  
		end

	describe '#release_bike' do  

		it "responds to release_bike" do   
			expect(subject).to respond_to(:release_bike)
		end

		it 'releases a bikes' do  
			bike = Bike.new      
			subject.dock(bike)   
			subject.release_bike()
			expect(subject.bike_array.length).to eq 0   
		end	

		it 'raises an error when no bikes are available' do
			expect { subject.release_bike}.to raise_error 'No bikes available'  #Here you are expecting your method release bike to raise an error if no bikes are parked, since we have not docked anything, we don't have a bike, and you get your error, the reason because you are using curly braces instead of parenthesis is to recover the software from the error, or tell it beforehand "hey do not freak out, an error may come but is expected"
		end



	end

 

end
