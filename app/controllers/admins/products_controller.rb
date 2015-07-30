class Admins::ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    if admin_signed_in?
      if product_params[:price].to_i >= 0 && product_params[:category_id].to_i > 0 && !product_params[:image].nil?
        product = Product.find_or_create_by(name: product_params[:name]) do |product|
          product.image = product_params[:image]
          product.category_id = product_params[:category_id]
          product.price = product_params[:price]
          product.description = product_params[:description]
        end
        flash[:success] = "Success!"
        redirect_to "/products/#{product.id}"
      else
        flash[:danger] = "Wrong params!"
        redirect_to :action => :new
      end
    end
  end

  def edit
    if admin_signed_in?
     if product_params[:price].to_i >= 0 && product_params[:category_id].to_i > 0 && !product_params[:image].nil?
        product = Product.find(params[:id])
        byebug
          product.name = product_params[:name]
          product.image = product_params[:image]
          product.category_id = product_params[:category_id]
          product.price = product_params[:price]
          product.description = product_params[:description]
          product.save
          byebug
        flash[:success] = "Success!"
        redirect_to "/products/#{product.id}"
      else
        flash[:danger] = "Wrong params!"
        redirect_to :action => :new
      end
    end
  end

  def destroy
    if admin_signed_in?
      @product = Product.find(params[:id])
      @product.destroy
      flash[:success] = "Deleted!"
      redirect_to :back
    end
  end

  def show
    if
      @product = Product.find(params[:id])
    else
      flash[:danger] = "Only Admin"
    end

  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description,
      :image, :category_id, :id)
  end

end