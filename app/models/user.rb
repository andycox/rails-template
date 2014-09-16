class User < ActiveRecord::Base
  devise :omniauthable, :trackable,
          :omniauth_providers => [:saml]

  def self.from_omniauth!(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create!
  end

  def display_name
    uid
  end
end
