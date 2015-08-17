require 'spec_helper'

describe Idea do

	it 'has a valid factory' do 
		expect(FactoryGirl.create(:idea)).to be_valid
	end

	it 'is invalid without name' do
		expect(FactoryGirl.build(:idea, :name => nil)).to_not be_valid
	end

	it 'is valid without key_partners' do 
		expect(FactoryGirl.build(:idea, :name => 'Awesome Idea',
			                       :key_partners => nil)
		).to be_valid
	end

	it 'is valid without key_activities' do 
		expect(FactoryGirl.build(:idea, :name => 'Awesome Idea',
			                       :key_activities => nil)
		).to be_valid
	end

	it 'is valid without key_resources' do 
		expect(FactoryGirl.build(:idea, :name => 'Awesome Idea',
			                       :key_resources => nil)
		).to be_valid
	end

	it 'is valid without value_propositions' do 
		expect(FactoryGirl.build(:idea, :name => 'Awesome Idea',
			                       :value_propositions => nil)
		).to be_valid
	end

	it 'is valid without customer_relationships' do 
		expect(FactoryGirl.build(:idea, :name => 'Awesome Idea',
			                       :customer_relationships => nil)
		).to be_valid
	end

	it 'is valid without channels' do 
		expect(FactoryGirl.build(:idea, :name => 'Awesome Idea',
			                       :channels => nil)
		).to be_valid
	end

	it 'is valid without customer_segments' do 
		expect(FactoryGirl.build(:idea, :name => 'Awesome Idea',
			                       :customer_segments => nil)
		).to be_valid
	end

	it 'is valid without cost_structure' do 
		expect(FactoryGirl.build(:idea, :name => 'Awesome Idea',
			                       :cost_structure => nil)
		).to be_valid
	end

	it 'is valid without revenue_streams' do 
		expect(FactoryGirl.build(:idea, :name => 'Awesome Idea',
			                       :revenue_streams => nil)
		).to be_valid
	end

	it "does not allow duplicate names" do 
		FactoryGirl.create(:idea, name: 'Awesome Idea')
		expect(FactoryGirl.build(:idea, name: 'Awesome Idea')).to_not be_valid
	end
end