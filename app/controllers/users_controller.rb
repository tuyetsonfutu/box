class Users::SessionsController < Devise::SessionsController
  include ApplicationHelper
  include CartsHelper
  include CategoriesHelper
  def create
    # custom sign-in code
  end
end