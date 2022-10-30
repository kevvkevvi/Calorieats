class CalculatorController < ApplicationController
  def index
  end

  def recommendation
    user_info = params[:user]
    user_hash = {'weight'=>user_info[:weight].to_d, 'height'=>user_info[:height].to_d, 
                 'age'=>user_info[:age].to_i, 'gender'=>params[:gender], 'sports_level'=>params[:sports_level]}
    @bmi = (user_hash['weight'])*10000/(user_hash['height'])**2
    puts user_hash
    puts session[:current_user]
  end

end
