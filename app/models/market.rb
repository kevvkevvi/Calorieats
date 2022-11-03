
class Market < ActiveRecord::Base
  # def self.all_category
  #   ['meat', 'vegetable', 'dairy', 'fruit']
  # end
  #def self.with_category(category)
   # if category.nil?
    #  all.order 
    #else
     # where(category: category.map(&:upcase)).order
    #end
  #end
  # def self.checkout(n1,n2,n3,n4,n5,n6,n7)
  #   cash = n1*(14.99)+n2*(19.99)+n3*(2.2)+n4*(0.52)+n5*(2.65)+n6*(0.79)+n7*(2.49)
  #   cash
  # end

  # def self.calorie(n1,n2,n3,n4,n5,n6,n7)
  #   calorie = n1*(1250)+n2*(1331)+n3*(153)+n4*(186)+n5*(677)+n6*(404)+n7*(237)
  #   calorie
  # end

  def self.recommended_food(bmi_result, sports_level, weight)
    # iter 2 add to shopping cart
    if bmi_result == 'underweight'
      'More protein such as beef'
    elsif bmi_result == 'overweight' or bmi_result == 'obese'
      'More vegetable and fruit such as broccoli and banana'
    elsif bmi_result == 'healthy'
      'Balanced diet of protein, vegetable, fruit and dairy'
    end
  end
end
