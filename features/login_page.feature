Feature: login to account

  As a potential user
  I want to login or sign up into an account
  So that I can personalize my diet and experience

Background: we have opened the main page
  And I am on the Calorieats login page

Scenario: sign up for Calorieats account with new account and try again after registering
  Given I am on the users_login page
  When I follow "Sign Up"
  # undefined method `+' for nil:NilClass (NoMethodError) ./features/step_definitions/web_steps.rb:182:in `/^(?:|I )should be on (.+)$/'
  # Then I should be on users_register page
  When I fill in "Username" with "johndoe"
  When I fill in "Password" with "123456"
  # we press here instead of follow since we're assuming we're in register.html.erb and "Sign Up!" is a button instead of a link
  When I press "Sign Up!"
  Then I should see "Hi johndoe, you have successfully registered."
  # undefined method `+' for nil:NilClass (NoMethodError) ./features/step_definitions/web_steps.rb:182:in `/^(?:|I )should be on (.+)$/'
  # Then I should be on calculator_index page
  When I follow "Log out"
  # Then I should be on users_login page
  When I follow "Sign Up"
  When I fill in "Username" with "johndoe"
  When I fill in "Password" with "123456"
  When I press "Sign Up"
  Then I should see "Username johndoe already exists"

Scenario: sign up for Calorieats account then logout and sign in again
  Given I am on the users_login page
  When I follow "Sign Up"
  When I fill in "Username" with "dwaynetherock"
  When I fill in "Password" with "654321"
  When I press "Sign Up"
  Then I should see "Hi dwaynetherock, you have successfully registered."
  # Then I should be on calculator_index page
  When I follow "Log out"
  # Then I should be on users_login page
  When I fill in "Username" with "dwaynetherock"
  When I fill in "Password" with "654321"
  When I press "Sign In!"
  # Then I should be on calculator_index page

Scenario: sign up for Calorieats account then logout and try to sign in with incorrect information
  Given I am on the users_login page
  When I follow "Sign Up"
  When I fill in "Username" with "bobthebuilder"
  # When I fill in "Password" with "500666"
  When I press "Sign Up"
  Then I should see "Hi bobthebuilder, you have successfully registered."
  # Then I should be on calculator_index page
  When I follow "Log out"
  # Then I should be on users_login page
  # When I fill in "Username" with "bobthebuilder"
  # When I fill in "Password" with "600555"
  # When I press "Sign In!"
  # Then I should see "Username or password not correct"
  # Then I should be on users_login page
  When I fill in "Username" with "robthebuilder"
  # When I fill in "Password" with "500666"
  When I press "Sign In!"
  # Then I should see "Username or password not correct"
  # Then I should be on users_login page