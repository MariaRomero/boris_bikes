require "docking_station"  			

describe DockingStation do
	let(:bike) { double :bike,:working? => true} 
	let(:broken_bike) { double :broken_bike,:working? => false}

	it "returns docked bikes" do  	 
		subject.dock(bike)	 
		expect(subject.bike_array.length).to eq 1    
	end

	it "docks a bike" do   
		subject.dock(bike)
		expect(subject.bike_array[0]).to eq bike   
	end

	it 'raises an error when dock is full' do
		DockingStation::DEFAULT_CAPACITY.times do
			subject.dock bike
		end 

		expect {subject.dock double(bike) }.to raise_error 'Dock is full'  
		end
	 
	describe "initialize method" do 

		it "sets capacity to 20 if no parameter is given" do 
			expect(subject.capacity).to eq 20
		end

		it "sets capacity when a parameter's given" do
			subject = DockingStation.new(10)
			expect(subject.capacity).to eq 10
		end
	end		
	
	describe "method full?" do
		it "returns false if less than 20 bikes are docked" do
			expect(subject.full?).to eq false	
		end	

		it "returns true if more than 20 bikes are docked" do
				DockingStation::DEFAULT_CAPACITY.times do 
				subject.dock(bike)
			end 
			expect(subject.full?).to eq true
		end
	end

	describe "method empty?" do

		it "returns true when dock is empty" do
			expect(subject.empty?).to eq true
		end

		it "returns false when dock is not empty" do
			subject.dock(bike)
			expect(subject.empty?).to eq false
		end
	end	

	describe 'method release_bike' do  

		it "responds to release_bike" do   
			expect(subject).to respond_to(:release_bike)
		end

		it 'releases a bike' do    
			subject.dock(bike)   
			subject.release_bike()
			expect(subject.bike_array.length).to eq 0   
		end	

		it "doesn't release broken bikes" do
			subject.dock(bike) 
			subject.dock(broken_bike)
			expect(subject.release_bike).to eq bike
		end

		it "releases broken bikes to the van" do
			subject.dock(broken_bike)
			subject.dock(broken_bike)
			subject.dock(bike)
			expect(subject.return_broken_bikes.length).to eq 2 
		end

		it "doesn't release bikes if all broken" do
			subject.dock(broken_bike)
			expect{subject.release_bike}.to raise_error 'Sorry This bike is not working'
		end	

		it 'raises an error when no bikes are available' do
			expect { subject.release_bike}.to raise_error 'No bikes available' 		end
	end
end
