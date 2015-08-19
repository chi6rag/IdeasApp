Feature: Ideas Page
	
	Scenario: Viewing all the ideas
		Given there's an idea by the name of "AwesomeIdea"
	  When I am on the ideas page
	  Then I should see a list of all the ideas

  Scenario: Viewing a single idea
    Given there's an idea by the name of "AwesomeIdea"
    When I am on the ideas page
    When I click on the "AwesomeIdea" link
    Then I should go to "AwesomeIdea" idea page
    Then I should see all the details for "AwesomeIdea" idea
    When I click on the "Back" link
    Then I should see a list of all the ideas