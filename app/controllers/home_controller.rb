class HomeController < ApplicationController
  skip_before_action :require_login

  def index
    if !signed_in?
      logger.debug "Autoredirect to signin"
      redirect_to signin_path
    end
  end
end
