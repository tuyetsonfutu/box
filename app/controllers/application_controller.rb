class ApplicationController < ActionController::Base
  before_action :call_category , only: [:show, :index]
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ApplicationHelper
  include CartsHelper
  include CategoriesHelper
  include SessionsHelper


  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
  end
end
