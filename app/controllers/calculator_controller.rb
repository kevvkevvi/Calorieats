class CalculatorController < ApplicationController
  def index
    @user = User.find(session[:current_user])
    puts @user.username
    puts @user.gender
    puts @user.gender == 'Female'
  end

  def recommendation
    user_info = params[:user]
    user_hash = {'weight'=>user_info[:weight].to_d, 'height'=>user_info[:height].to_d, 
                 'age'=>user_info[:age].to_i, 'gender'=>params[:gender], 'sports_level'=>params[:sports_level]}
    @bmi = user_hash['weight']/(user_hash['height']/100)**2
    # update user
    @user = User.find(session[:current_user])
    @user.update_attributes!(user_hash)
    flash[:notice] = "#{@user.username} was successfully updated."
  end
end
