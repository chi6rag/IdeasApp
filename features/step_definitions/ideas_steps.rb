Given (/^there's an idea by the name of "(.*)"$/) do |idea_name|
  FactoryGirl.create(:idea, name: idea_name)
end

When (/^I am on the ideas page$/) do 
	visit ideas_path
end

Then (/^I should go to the ideas page$/) do 
	expect(current_path).to eq(ideas_path)
end

Then (/^I should see a list of all the ideas$/) do
	@ideas = Idea.all
	within('.ideas-list') do 
		@ideas.each do |idea|
			idea_name = idea.name
			expect(page).to have_content(idea_name)
		end
	end
end

When (/^I click on the "(.*)" link$/) do |link|
	click_link link
end

And (/^I click the "(.*)" button$/) do |button|
	click_button button
end

Then (/^I should go to "(.*)" idea page$/) do |idea_name|
	@idea = Idea.find_by_name(idea_name)
	expect(current_path).to eq("/ideas/#{@idea.id}")
end

Then (/^I should see all the details for "(.*)" idea$/) do |idea_name|
	@idea = Idea.find_by_name(idea_name)
	@idea.attributes.each do |attribute_key, attribute_value|
		next if( attribute_key == "id" || attribute_key == "created_at" || attribute_key == "updated_at" )
		expect(page).to have_content(attribute_value)
	end
end

Then (/^I should go to the new idea page$/) do 
	expect(current_path).to eq(new_idea_path)
end

When (/^I fill in the "(.*)" form with the values$/) do |form_name, table|
	form_id = '#' + form_name.gsub(' ', '_')
	# if the current_path has :id/edit in it, then add "_#{:id}" to the form id
	form_id << '_' + current_path.match(/(\d+)\/edit$/)[1] if current_path.try(:match, /(\d+)\/edit$/)
	within(form_id) do 
		table.rows_hash.each do |input_field_id, value|
			input_field_id = 'idea_' + input_field_id
			fill_in input_field_id, with: value
		end
	end
end

Then (/^I should see an error modal with the following errors$/) do |table|
	# finding all the errors in the errorModal
	error_modal = page.find(:css, '#errorModal', visible: true)
	expected_errors = table.raw.flatten
	expected_errors.each do |error|
		expect(error_modal).to have_content(error)
	end
	# closing the errorModal
	within('#errorModal') do
    find('button.close').click
	end
end

Then (/^I should see a notice modal with the following notices$/) do |table|
	# finding all the notices in the noticeModal
	notice_modal = page.find(:css, '#noticeModal', visible: true)
	expected_notices = table.raw.flatten
	expected_notices.each do |notice|
		expect(notice_modal).to have_content(notice)
	end
	# closing the noticeModal
	within('#noticeModal') do
    find('button.close').click
	end
end

And (/^I should see the details of "(.*)" as$/) do |idea_name, table|
	@idea = Idea.find_by_name(idea_name)
	table.rows_hash.each do |key, value|
		expect(page).to have_content(value)
	end
end

And (/^I click the "(.*)" input submit tag$/) do |tag|
	submit_tag = %Q|input[value='#{tag}']|
	find(:css, submit_tag).click
end

Then (/^I should go to the edit idea page for "(.*)" idea$/) do |idea_name|
	@idea = Idea.find_by_name(idea_name)
	expect(current_path).to eq("/ideas/#{@idea.id}/edit")
end

And (/^I should not see "(.*)" idea$/) do |idea_name|
	expect(page).to_not have_content idea_name
end