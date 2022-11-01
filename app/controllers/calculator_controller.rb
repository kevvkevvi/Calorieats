class CalculatorController < ApplicationController
  helper :all
  def index
    @user = User.find(session[:current_user])
    @gender = @user.gender
    @sports_level = @user.sports_level
    puts @sports_level
  end

  def recommendation
    user_info = params[:user]
    puts user_info
    user_hash = {'weight'=>user_info[:weight].to_d, 'height'=>user_info[:height].to_d, 
                 'age'=>user_info[:age].to_i, 'gender'=>params[:gender], 'sports_level'=>params[:sports_level]}
    puts user_hash
    @bmi = user_hash['weight']/(user_hash['height']/100)**2
    @bmi_result =  User.bmi_classifier(@bmi, user_info[:age])
    # update user
    @user = User.find(session[:current_user])
    @user.update_attributes!(user_hash)
    flash[:notice] = "#{@user.username}, your info has successfully updated and here is your report."

    @recommended_food =  Market.recommended_food(@bmi_result, user_hash['sports_level'], user_hash['weight'])
  end
end
