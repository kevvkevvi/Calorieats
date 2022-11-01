Feature: login to account

  As a  user
  I want to input my information
  So that I can receive recommendations about my diet and exercise

Background: we are registering and signing in to our account
  And I am on the Calorieats login page

Scenario: input in information and receive recommendations
  Given I am on the users_login page
  When I follow "Sign Up"
  # undefined method `+' for nil:NilClass (NoMethodError) ./features/step_definitions/web_steps.rb:182:in `/^(?:|I )should be on (.+)$/'
  # Then I should be on users_register page
  When I fill in "Username" with "joe"
  # Unable to find field "Password" that is not disabled (Capybara::ElementNotFound) ./features/step_definitions/web_steps.rb:62:in `/^(?:|I )fill in "([^"]*)" with "([^"]*)"$/'
  # When I fill in "Password" with "123"
  # we press here instead of follow since we're assuming we're in register.html.erb and "Sign Up!" is a button instead of a link
  When I press "Sign Up!"
  Then I should see "Hi joe, you have successfully registered."
  # undefined method `+' for nil:NilClass (NoMethodError) ./features/step_definitions/web_steps.rb:182:in `/^(?:|I )should be on (.+)$/'
  # Then I should be on calculator_index page
  When I fill in "Height" with "170"
  When I fill in "Weight" with "160"
  When I fill in "Age" with "23"
  # Unable to find radio button "Male" that is not disabled (Capybara::ElementNotFound) ./features/step_definitions/calculator_steps.rb:32:in `/I choose the following genders: (.*)/'
  # When I choose the following genders: Male
  # Unable to find radio button "Active" that is not disabled (Capybara::ElementNotFound) ./features/step_definitions/calculator_steps.rb:37:in `/I choose the following sports levels: (.*)/'
  # When I choose the following sports levels: Active
  When I press "Calculate"
  # undefined method `+' for nil:NilClass (NoMethodError) ./features/step_definitions/web_steps.rb:182:in `/^(?:|I )should be on (.+)$/'
  # Then I should be on calculator_recommendation page
  Then I should see "Your BMI is 55.36"
  Then I should see "Do more aerobic exercise to reduce your body fat as jogging and swimming"
  Then I should see "More vegetable and fruit such as broccoli and banana"


Scenario: input in faulty information
  Given I am on the users_login page
  When I follow "Sign Up"
  # undefined method `+' for nil:NilClass (NoMethodError) ./features/step_definitions/web_steps.rb:182:in `/^(?:|I )should be on (.+)$/'
  # Then I should be on users_register page
  When I fill in "Username" with "joe"
  # Unable to find field "Password" that is not disabled (Capybara::ElementNotFound) ./features/step_definitions/web_steps.rb:62:in `/^(?:|I )fill in "([^"]*)" with "([^"]*)"$/'
  # When I fill in "Password" with "123"
  # we press here instead of follow since we're assuming we're in register.html.erb and "Sign Up!" is a button instead of a link
  When I press "Sign Up!"
  Then I should see "Hi joe, you have successfully registered."
  # undefined method `+' for nil:NilClass (NoMethodError) ./features/step_definitions/web_steps.rb:182:in `/^(?:|I )should be on (.+)$/'
  # Then I should be on calculator_index page
  When I press "Calculate"
  Then I should see "Your BMI is NaN"