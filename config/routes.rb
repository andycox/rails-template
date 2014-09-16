Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root 'home#index'

  # Authentication stuff via Devise + OmniAuth SAML
  devise_for :users,
    :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    get 'signout', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  get '/goodbye', :to => 'home#goodbye', :as => 'goodbye'
  get '/signin_error', :to => 'home#signin_error', :as => 'signin_error'
end
