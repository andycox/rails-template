# This is application-specific, so rename after taking the template
module RailsTemplate
  def self.enable_omniauth_mock!(mock_signin_role = :standard)
    OmniAuth.config.test_mode = true
    mock_failed_signin = (mock_signin_role == :invalid_credentials)

    if mock_failed_signin
      OmniAuth.config.mock_auth[:saml] = :invalid_credentials
    else
      OmniAuth.config.mock_auth[:saml] = mock_sso_credentials(mock_signin_role)
    end

    # https://github.com/intridea/omniauth/wiki/FAQ
    OmniAuth.config.on_failure = Proc.new { |env|
      OmniAuth::FailureEndpoint.new(env).redirect_to_failure
    }
  end

  private

  def self.mock_sso_credentials(role)
    uid = "mock.#{role}.user@domain.com"

    OmniAuth::AuthHash.new({
      # TODO: Need to verify what SSO provides and OmniAuth SAML returns
      :provider => 'saml',
      :uid => uid,
      :info => {
        :name => nil,
        :email => nil,
        :first_name => nil,
        :last_name => nil
      }
    })
  end

  def self.saml_idp_sso_target_url
    ENV['RAILS_TEMPLATE_SAML_IDP_TARGET_URL']
  end

  def self.saml_idp_certificate
    ENV['RAILS_TEMPLATE_SAML_IDP_CERTIFICATE'] # default?
  end

  def self.saml_idp_certificate_fingerprint
    ENV['RAILS_TEMPLATE_SAML_IDP_CERTIFICATE_FINGERPRINT'] # default?
  end

  def self.saml_callback_url
    ENV['RAILS_TEMPLATE_SAML_CALLBACK_URL']
  end

  def self.sso_enabled?
    true
  end

end

# Allow SAML without an IdP in dev
if Rails.env.development?
  Rails.logger.info "Mocking SAML authentication"
  RailsTemplate.enable_omniauth_mock!
end

if !Rails.env.development? && !Rails.env.test?
  if RailsTemplate.sso_enabled?
    if !RailsTemplate.saml_idp_sso_target_url
      raise "SAML target URL must be configured"
    end
    # TODO Clean this up based on final decision of cert vs. fingerprint
    if !RailsTemplate.saml_idp_certificate &&
       !RailsTemplate.saml_idp_certificate_fingerprint
      raise "SAML certificate or fingerprint must be configured"
    end
  end
end
