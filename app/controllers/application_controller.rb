class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login

  protected

  def signin_path
    user_omniauth_authorize_path(:provider => :saml)
  end
  helper_method :signin_path

  def require_login
    unless user_signed_in?
      # After sign-in, redirect to the current page
      store_location_for :user, request.fullpath
      redirect_to signin_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    goodbye_path
  end
end
