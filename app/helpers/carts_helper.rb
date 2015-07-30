module CartsHelper

  def cart_product
    session[:cart] || {}
  end

end
