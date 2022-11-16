Feature: login to account

  As a  user
  I want to input my information
  So that I can receive recommendations about my diet and exercise

Background: we are registering and signing in to our account
  And I am on the Calorieats login page

Scenario: input in information and receive recommendations
  Given I am on the users_login page
  When I follow "Sign Up"
  Then I should be on users_register page
  When I fill in "Username" with "joe"
  When I fill in "Password" with "123"
  # we press here instead of follow since we're assuming we're in register.html.erb and "Sign Up!" is a button instead of a link
  When I press "Sign Up!"
  Then I should see "Hi joe, you have successfully registered."
  Then I should be on calculator_index page
  When I fill in "Height" with "170"
  When I fill in "Weight" with "160"
  When I fill in "Age" with "23"
  When I choose the following genders: Male
  When I choose the following sports levels: Active
  When I press "Calculate"
  Then I should be on calculator_index page
  Then I should see "Your BMI is 55.36"
  Then I should see "Do more aerobic exercise to reduce your body fat as jogging and swimming"
  Then I should see "More vegetable and fruit such as broccoli and banana"

Scenario: input in faulty information --> sad path
  Given I am on the users_login page
  When I follow "Sign Up"
  Then I should be on users_register page
  When I fill in "Username" with "joe"
  When I fill in "Password" with "123"
  # we press here instead of follow since we're assuming we're in register.html.erb and "Sign Up!" is a button instead of a link
  When I press "Sign Up!"
  Then I should see "Hi joe, you have successfully registered."
  Then I should be on calculator_index page
  When I press "Calculate"
  Then I should see "Your BMI is NaN"

Scenario: input negative weight --> sad path
  Given I am on the users_login page
  When I follow "Sign Up"
  Then I should be on users_register page
  When I fill in "Username" with "joe"
  When I fill in "Password" with "123"
  # we press here instead of follow since we're assuming we're in register.html.erb and "Sign Up!" is a button instead of a link
  When I press "Sign Up!"
  Then I should see "Hi joe, you have successfully registered."
  Then I should be on calculator_index page
  When I fill in "Height" with "170"
  When I fill in "Weight" with "-70"
  When I fill in "Age" with "30"
  When I choose the following genders: Male
  When I choose the following sports levels: Active
  When I press "Calculate"
  Then I should see "Weight must be between 0 and 500."


Scenario: input negative height --> sad path
  Given I am on the users_login page
  When I follow "Sign Up"
  Then I should be on users_register page
  When I fill in "Username" with "joe"
  When I fill in "Password" with "123"
  # we press here instead of follow since we're assuming we're in register.html.erb and "Sign Up!" is a button instead of a link
  When I press "Sign Up!"
  Then I should see "Hi joe, you have successfully registered."
  Then I should be on calculator_index page
  When I fill in "Height" with "-170"
  When I fill in "Weight" with "70"
  When I fill in "Age" with "30"
  When I choose the following genders: Male
  When I choose the following sports levels: Active
  When I press "Calculate"
  Then I should see "Height must be between 0 and 300."

Scenario: input negative age --> sad path
  Given I am on the users_login page
  When I follow "Sign Up"
  Then I should be on users_register page
  When I fill in "Username" with "joe"
  When I fill in "Password" with "123"
  # we press here instead of follow since we're assuming we're in register.html.erb and "Sign Up!" is a button instead of a link
  When I press "Sign Up!"
  Then I should see "Hi joe, you have successfully registered."
  Then I should be on calculator_index page
  When I fill in "Height" with "170"
  When I fill in "Weight" with "70"
  When I fill in "Age" with "-30"
  When I choose the following genders: Male
  When I choose the following sports levels: Active
  When I press "Calculate"
  Then I should see "Age must be between 0 and 200."