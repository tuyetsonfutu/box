class CategoriesController < ApplicationController
  include CategoriesHelper
  def show
    category = Category.find(params[:id])
    @products = category.products
  end

end
