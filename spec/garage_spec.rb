require "garage"



	describe Garage do
		let(:bike) {double :bike, :working? => true }
		let(:broken_bike) { double :broken_bike, :working => false, :working? => false, :fix_bike => true}
		let(:van) { double :van, :release_broken_bikes => [broken_bike] }


		it "takes broken bikes" do
			expect(subject).to respond_to(:store_bikes)
		end	

		it "stores bikes fixed" do
			subject.store_bikes(van)
			expect(subject.working_bikes[0]).to eq broken_bike
		end	
	end 