Feature: Ideas Page
	
	Scenario: Viewing all the ideas
		Given there's an idea by the name of "AwesomeIdea"
	  When I am on the ideas page
	  Then I should see a list of all the ideas

  Scenario: Viewing and Deleting a single idea
    Given there's an idea by the name of "AwesomeIdea"
    When I am on the ideas page
    When I click on the "AwesomeIdea" link
    Then I should go to "AwesomeIdea" idea page
    Then I should see all the details for "AwesomeIdea" idea
    When I click on the "Back" link
    Then I should see a list of all the ideas

  Scenario: Creating and Editing a new Idea
    When I am on the ideas page
    And I click on the "New Idea" link
    Then I should go to the new idea page
    When I fill in the "new idea" form with the values
    | key_partners           | Key Partners           |
		| key_activities         | Key Activities         |
		And I click the "Create Idea" input submit tag
		Then I should see an error modal with the following errors
		| Name can't be blank |
    When I fill in the "new idea" form with the values
		| name                   | AwesomeIdea            |
		| key_partners           | Key Partners           |
		| key_activities         | Key Activities         |
		| key_resources          | Key Resources          |
		| value_propositions     | Value Propositions     |
		| customer_relationships | Customer Relationships |
		| channels               | Channels               |
		| customer_segments      | Customer Segments      |
		| cost_structure         | Cost Structure         |
		| revenue_streams        | Revenue Streams        |
		And I click the "Create Idea" input submit tag
		Then I should go to "AwesomeIdea" idea page
		Then I should see a notice modal with the following notices
		| Idea was successfully created. |
		And I should see the details of "AwesomeIdea" as
		| name                   | AwesomeIdea            |
		| key_partners           | Key Partners           |
		| key_activities         | Key Activities         |
		| key_resources          | Key Resources          |
		| value_propositions     | Value Propositions     |
		| customer_relationships | Customer Relationships |
		| channels               | Channels               |
		| customer_segments      | Customer Segments      |
		| cost_structure         | Cost Structure         |
		| revenue_streams        | Revenue Streams        |
		When I click on the "Edit" link
		Then I should go to the edit idea page for "AwesomeIdea" idea
		When I fill in the "edit idea" form with the values
		| name                   | NewAwesomeIdea            |
		| key_partners           | NewKey Partners           |
		| key_activities         | NewKey Activities         |
		| key_resources          | NewKey Resources          |
		| value_propositions     | NewValue Propositions     |
		| customer_relationships | NewCustomer Relationships |
		| channels               | NewChannels               |
		| customer_segments      | NewCustomer Segments      |
		| cost_structure         | NewCost Structure         |
		| revenue_streams        | NewRevenue Streams        |
		And I click the "Update Idea" input submit tag
		Then I should go to "NewAwesomeIdea" idea page
		Then I should see a notice modal with the following notices
		| Idea was successfully updated. |
		And I should see the details of "NewAwesomeIdea" as
		| name                   | NewAwesomeIdea            |
		| key_partners           | NewKey Partners           |
		| key_activities         | NewKey Activities         |
		| key_resources          | NewKey Resources          |
		| value_propositions     | NewValue Propositions     |
		| customer_relationships | NewCustomer Relationships |
		| channels               | NewChannels               |
		| customer_segments      | NewCustomer Segments      |
		| cost_structure         | NewCost Structure         |
		| revenue_streams        | NewRevenue Streams        |

  Scenario: Deleting an idea
    Given there's an idea by the name of "AwesomeIdea"
    When I am on the ideas page
    When I click on the "AwesomeIdea" link
    And I click on the "Delete" link
    Then I should go to the ideas page
    And I should not see "AwesomeIdea" idea