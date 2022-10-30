
class Market < ActiveRecord::Base
  def self.all_category
    ['meat', 'vegetable', 'dairy', 'fruit']
  end
  def self.with_category(category)
    if category.nil?
      all.order 
    else
      where(category: category.map(&:upcase)).order
    end
  end
end
