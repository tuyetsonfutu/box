class CartProductsController < ApplicationController
  before_action :call_category , only: [:new, :index]
  include CategoriesHelper

  def add
    if params[:id].nil? || params[:quantity].nil?
      flash[:danger] = "Product not found!"
      redirect_to :action => :index
    end
    if params[:quantity].to_i > 0
      id = params[:id]
      if session[:cart] then
        cart_product = session[:cart]
      else
      session[:cart] ={}
      cart_product = session[:cart]
      end

      if cart_product[id] then
        cart_product[id] = cart_product[id] + params[:quantity].to_i
      else
        cart_product[id] = params[:quantity].to_i
      end
      flash[:success] = "success"
      redirect_to :back
    end
  end

  def remove
    session[:cart].delete(params[:id].to_s)
    redirect_to :action => :index
  end

  def update
    if params[:new_quantity].nil? || params[:id].nil?
      flash[:danger] = "Product not found!"
    else
      session[:cart][params[:id].to_s] = params[:new_quantity].to_i
    end
      redirect_to :action => :index
  end
  def clear
    session[:cart] = nil
    redirect_to :action => :index
  end

  def index
    if session[:cart] then
      @cart_product = session[:cart]
    else
      @cart_product = {}
    end
  end
end