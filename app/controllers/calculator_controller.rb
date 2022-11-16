class CalculatorController < ApplicationController
  helper :all
  def index
    begin
      @user = User.find(session[:current_user])
    rescue
      redirect_to users_login_path, notice: "Please log in"
    else
      @user = User.find(session[:current_user])
      @gender = @user.gender
      @sports_level = @user.sports_level
      puts @sports_level
    end
  end

  def recommendation
    user_info = params[:user]
    user_hash = {'weight'=>user_info[:weight].to_d, 'height'=>user_info[:height].to_d, 
                 'age'=>user_info[:age].to_i, 'gender'=>params[:gender], 'sports_level'=>params[:sports_level]}

    if user_hash['weight'].to_f < 0 or user_hash['weight'].to_f > 500
      flash[:notice] = "Weight must be between 0 and 500."
      @bmi = 0
      @bmi_result = 'NaN'
      return
    end

    if user_hash['height'].to_f < 0 or user_hash['height'].to_f > 300
      flash[:notice] = "Height must be between 0 and 300."
      @bmi = 0
      @bmi_result = 'NaN'
      return
    end

    if user_hash['age'].to_f < 0 or user_hash['age'].to_f > 200
      flash[:notice] = "Age must be between 0 and 200."
      @bmi = 0
      @bmi_result = 'NaN'
      return
    end

    @bmi = user_hash['weight']/(user_hash['height']/100)**2
    @bmi_result =  User.bmi_classifier(@bmi, user_info[:age])
    @sports_suggestion = User.sports_recommendation(@bmi_result)
    # update user
    @user = User.find(session[:current_user])
    @user.update_attributes!(user_hash)
    flash[:notice] = "#{@user.username}, your info has successfully updated and here is your report."

    @recommended_food =  Market.recommended_food(@bmi_result, user_hash['sports_level'], user_hash['weight'])
  end
end
