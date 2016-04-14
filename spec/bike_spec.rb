require "bike"

describe Bike do

	it { is_expected.to respond_to :working? }  	

	describe "method working?" do

		it "returns true when a bike is creating with no parameter" do
			expect(subject.working?).to eq true
		end	

		it "returns false for a broken bike" do
			subject = Bike.new(false)
			expect(subject.working?).to eq false
		end
	end	

	describe "method break_bike" do

		it "reports a broken bike" do
			expect(subject.break_bike).to eq false
		end	
	end	


end