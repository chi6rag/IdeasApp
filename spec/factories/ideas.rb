require 'faker'

FactoryGirl.define do 
	factory :idea do |f|
		f.name { Faker::Company.name }
	end
end