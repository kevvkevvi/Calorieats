Feature: shop in market

  As a user
  I want to shop grocery in market
  So that I can follow recommendations and eat healthy

Background: I am shopping grocery in market
  And I am on the Calorieats market page

#Background: we have opened the main page
  #And I am on the Calorieats login page

Scenario: input in quantity of food and checkout
  Given I am on the users_login page
  When I follow "Sign Up"
  When I fill in "Username" with "dwaynetherock"
  When I fill in "Password" with "654321"
  When I press "Sign Up"
  Then I should see "Hi dwaynetherock, you have successfully registered."
  Then I should be on calculator_index page
  When I follow "Log out"
  Then I should be on users_login
  When I fill in "Username" with "dwaynetherock"
  When I fill in "Password" with "654321"
  When I press "Sign In!"
  Then I should be on calculator_index page

  Given I am on the market_index page
  Then I should see "Welcome to Calorieats Market"
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
  Then I should see "Your purchase:"
  Then I should see "beef(1lb):3"
  Then I should see "lamb(1lb):2"
  Then I should see "broccoli(1lb):3"
  Then I should see "carrot(1lb):1"
  Then I should see "milk(1lb):1"
  Then I should see "banana(1lb):1"
  Then I should see "apple(1lb):1"
  Then I should see "Your total cost is 98.0"
  Then I should see "The total calories of the food you buy is 8375"
  
  When I follow "Continue to pay"
  Then I should be on market_pay page
  Then I should see "Pay Successfully!"



 

Scenario: reset quantity of food
  Given I am on the users_login page
  When I follow "Sign Up"
  When I fill in "Username" with "dwaynetherock"
  When I fill in "Password" with "654321"
  When I press "Sign Up"
  Then I should see "Hi dwaynetherock, you have successfully registered."
  Then I should be on calculator_index page
  When I follow "Log out"
  Then I should be on users_login
  When I fill in "Username" with "dwaynetherock"
  When I fill in "Password" with "654321"
  When I press "Sign In!"
  Then I should be on calculator_index page

  Given I am on the market_index page
  When I fill in "Beef" with "2"
  Then I press "Reset"
  Then I should be on market_index page
  Then I should see "Beef" revert to empty


Scenario: purchase nothing and checkout  -->sad path
Given I am on the users_login page
  When I follow "Sign Up"
  When I fill in "Username" with "dwaynetherock"
  When I fill in "Password" with "654321"
  When I press "Sign Up"
  Then I should see "Hi dwaynetherock, you have successfully registered."
  Then I should be on calculator_index page
  When I follow "Log out"
  Then I should be on users_login
  When I fill in "Username" with "dwaynetherock"
  When I fill in "Password" with "654321"
  When I press "Sign In!"
  Then I should be on calculator_index page

  Given I am on the market_index page
  Then I press "checkout"
  Then I should be on market_index page
  Then I should see "There is nothing in your cart, back to purchase something"
  When I follow "Back to market"
  Then I should be on market_index page