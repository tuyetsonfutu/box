module CategoriesHelper
  def call_category
     @categories = Category.all
  end
end
