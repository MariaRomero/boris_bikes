
require 'bikecontainer'

	describe BikeContainer  do 
		let(:bike) {double :bike, :working? => true }

		it "counts how many bikes are in the working bike array" do 
			subject.count_working_bikes([bike,bike,bike])
			(subject.count_working_bikes.length).to eq 3
		end
		
	end