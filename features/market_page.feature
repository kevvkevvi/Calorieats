Feature: shop in market

  As a user
  I want to shop grocery in market
  So that I can follow recommendations and eat healthy

Background: I am shopping grocery in market
  And I am on the Calorieats market page

Scenario: input in quantity of food and receive infomation on total cost and total calories 
  Given I am on the market_index page

  When I fill in "Beef" with "3"
  When I fill in "Lamb" with "2"
  When I fill in "Broccoli" with "3"
  When I fill in "Carrot" with "1"
  When I fill in "Milk" with "1"
  When I fill in "Banana" with "1"
  When I fill in "Apple" with "1"
  Then I press "checkout"
  Then I should be on market_index page
  Then I should see "Checkout Page"
  Then I should see "Your total cost is 97.99999999999999"
  Then I should see "The total calories of the food you buy is 8375"



Scenario: reset quantity of food
  Given I am on the market_index page

  When I fill in "Beef" with "2"
  Then I press "Reset"
  Then I should be on market_index page
  Then I should see "Beef" revert to empty
 