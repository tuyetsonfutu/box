class ProductsController < ApplicationController

  include CategoriesHelper

  def index
    @products = Product.paginate(page: params[:page], :per_page => 50)
  end

  def show
    @product = Product.find(params[:id])
  end

  def add

  end

end
