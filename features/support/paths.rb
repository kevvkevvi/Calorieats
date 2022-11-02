# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the (Calorieats )?login\s?page$/ then 'users/login'
    # ***doesn't work: when /^(?:|I )should be on users_register page$/ then 'users/register'
    when /users_register page/ then '/users/register'
    # ***doesn't work: when /^(?:|I )should be on calculator_index page$/ then 'calculator/index'
    when /calculator_index page/ then '/calculator/index'
    # when /login page/ then 'users/login'
    when /calculator_recommendation page/ then '/calculator/recommendation'
    when /users_login/ then '/users/login'

    when /^the (Calorieats )?calculator\s?page$/ then 'calculator/index'
    
    when /^the (Calorieats )?market\s?page$/ then 'market/index'
    when /market_index/ then '/market/index'
    
    #when /^the market_index page for ("Reset")?$/ then '/market/index'

    when /^the (Calorieats )?market\s?page$/ then 'market/cart'
    when /market_index/ then '/market/cart'
    when /market_cart/ then '/market/cart'
    when /^the market_index page for ("checkout")?$/ then '/market/cart'
    

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
