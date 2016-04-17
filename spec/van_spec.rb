
require "van"


describe Van do
	let(:bike) {double :bike, :working? => true}
	let(:broken_bike) { double :broken_bike, :working? => false}
	let(:docking_station) {double :docking_station, :return_broken_bikes => [:broken_bike]}
	

	it "recognizes if bikes are broken" do
		expect(subject).to respond_to(:store_bikes)
	end	

	it "stores broken bikes in the broken bike array" do
		subject.store_bikes(broken_bike)
		expect(subject.broken_bikes[0]).to eq broken_bike
	end

	it "stores working bikes in the working bike array" do
		subject.store_bikes(bike)
		expect(subject.working_bikes[0]).to eq bike
	end	

	it "receives broken bikes from the docking station" do
		subject.sorts_broken_bikes(docking_station)
		expect(subject.broken_bikes.length).to eq 1
	end	

	it "releases broken bikes" do
		subject.store_bikes(broken_bike)
		subject.releases_broken_bikes
		expect(subject.broken_bikes.length).to eq 0
	end	

	it "releases working bikes" do
		subject.store_bikes(bike)
		subject.releases_working_bikes 
		expect(subject.working_bikes.length).to eq 0
	end	


end	

