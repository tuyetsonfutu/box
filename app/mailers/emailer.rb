class Emailer < ApplicationMailer
  include ApplicationHelper
  include CartsHelper
  include CategoriesHelper
  def send_email_to(email,cart)
    mail to: email, subject: "Venshop!!"
    @cart_product = cart
  end
end
