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

  # def self.find_residue(name)
  #   market = Market.find_by(name: name)
  # end
end
