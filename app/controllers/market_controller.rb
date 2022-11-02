class MarketController < ApplicationController
  def index
    @markets = Market.all_category
  end

  def cart
    user_info = params[:user]
    user_cash = {'n1'=>user_info[:number1].to_i,'n2'=>user_info[:number2].to_i,'n3'=>user_info[:number3].to_i,'n4'=>user_info[:number4].to_i,
                  'n5'=>user_info[:number5].to_i,'n6'=>user_info[:number6].to_i,'n7'=>user_info[:number7].to_i}
    @cash = (user_cash['n1'])*(14.99)+user_cash['n2']*(19.99)+user_cash['n3']*(2.2)+user_cash['n4']*(0.52)+user_cash['n5']*(2.65)+
              user_cash['n6']*(0.79)+user_cash['n7']*(2.49)
    @calory = user_cash['n1']*(1250)+user_cash['n2']*(1331)+user_cash['n3']*(153)+user_cash['n4']*(186)+user_cash['n5']*(677)+
                user_cash['n6']*(404)+user_cash['n7']*(237)
    puts user_cash
    puts session[:current_user]
  end

  #def show
   # name = params[:name] # retrieve movie ID from URI route
    #@name = Market.find(name) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  #end

  # def index
  #   @all_category = Market.all_category
  #   @market = Market.with_category(category_list, sort_by)
  #   @category_to_show_hash = category_hash
  #   @sort_by = sort_by
  #   # remember the correct settings for next time
  #   session['category'] = category_list
  #   session['sort_by'] = @sort_by
  # end

  # private

  # def sort_by
  #   params[:sort_by] || session[:sort_by] || 'name'
  # end

  # def category_hash
  #   Hash[category_list.collect { |item| [item, "1"] }]
  # end

  # def category_list
  #   params[:category]&.keys || session[:category] || Market.all_category
  # end

  # def force_index_redirect
  #   if !params.key?(:category) || !params.key?(:sort_by)
  #     flash.keep
  #     url = market_path(sort_by: sort_by, category: category_hash)
  #     redirect_to url
  #   end
  # end
end
  