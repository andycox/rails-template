Given(/^I am an authenticated user$/) do
  RailsTemplate.enable_omniauth_mock!
  visit root_url
end

Given(/^I am an authenticated admin user$/) do
  create(:user, :provider => :saml, :uid => "mock.admin.user@domain.com", :admin => true)
  RailsTemplate.enable_omniauth_mock!(:admin)
  visit root_url
end
