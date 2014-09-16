class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token, :only => [:saml]
  skip_before_action :require_login

  def saml
    Rails.logger.info "Callback for SAML provider"
    Rails.logger.info auth_hash

    @user = User.from_omniauth!(auth_hash)
    Rails.logger.info "Authenticated #{@user.uid} for SAML provider"

    sign_in_and_redirect @user, :event => :authentication
    set_flash_message(:notice, :success, :kind => "SAML") if is_navigational_format?
  end

  private

  def auth_hash
    @auth_hash ||= request.env['omniauth.auth']
  end
end
