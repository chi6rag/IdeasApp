require 'faker'

FactoryGirl.define do 
	factory :idea do |f|
		f.name { Faker::Company.name }
	end

	factory :invalid_idea, parent: :idea do |f|
		f.name nil
	end
end