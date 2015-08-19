Given (/^there's an idea by the name of "(.*)"$/) do |idea_name|
  FactoryGirl.create(:idea, name: idea_name)
end

When (/^I am on the ideas page$/) do 
	visit ideas_path
end

Then (/^I should see a list of all the ideas$/) do
	@ideas = Idea.all
	within(:table) do 
		@ideas.each do |idea|
			idea_name = idea.name
			expect(page).to have_content(idea_name)
		end
	end
end

When (/^I click on the "(.*)" link$/) do |link|
	click_link link
end

Then (/^I should go to "(.*)" idea page$/) do |idea_name|
	@idea = Idea.find_by_name(idea_name)
	expect(current_path).to eq("/ideas/#{@idea.id}")
end

Then (/^I should see all the details for "(.*)" idea$/) do |idea_name|
	@idea = Idea.find_by_name(idea_name)
	@idea.attributes.each do |attribute_key, attribute_value|
		next if attribute_key == "id" || "created_at" || "updated_at"
		expect(page).to have_content(attribute_value)
		puts "Page has #{attribute_value}"
	end
end