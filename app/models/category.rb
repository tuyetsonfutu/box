class Category < ActiveRecord::Base
  has_many :products

  def new
    @category = Category.new
  end

#   def create
#     @category = Category.new
#   end
end
