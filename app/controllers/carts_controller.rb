class CartsController < ApplicationController

  include CategoriesHelper
  def show
    if user_signed_in?
      @show_cart = Cart.where(user_id: current_user.id)
    end
  end

  def create
    if !session[:cart].nil?
      new_cart = Cart.new(cart_params)
      new_cart.total_price = calculate_total_price
      new_cart.status = "In process"
      if user_signed_in?
        new_cart.user_id = current_user.id
      end
      new_cart.save
      if !new_cart.id.nil?
        session[:cart].each do |id, quantity|
          cart_product = CartProduct.new
          cart_product.cart_id = new_cart.id
          cart_product.product_id = id
          cart_product.price = Product.find_by_id(id).price
          cart_product.quantity = quantity
          cart_product.save
        end
        Emailer.send_email_to(cart_params[:mail].to_s,session[:cart]).deliver
        flash[:success] = "Success!"
        session[:cart] = nil
      end
    end
    redirect_to :action => "show"
  end

  def info
    if user_signed_in?
      @current_user
    end
  end

  def cart_params
    params.require(:session).permit(:name, :mail, :address)
  end

  private

  def calculate_total_price
    total = 0
    if !session[:cart].nil?
      session[:cart].each do |id, quantity|
      product = Product.find_by_id(id)
      if !product.nil?
        total = total + product.price * quantity
      end
    end
    end
    total
  end

end
