source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.2.1'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
# Need this in development for local asset precompilation
group :development, :production do
  gem 'uglifier', '>= 1.3.0'
end

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# Be sure this is loaded before anything that needs ENV
# Let's try dotenv in production as well
gem 'dotenv-rails', '~> 0.10'
gem 'dotenv-deployment'

group :development do
  gem 'foreman'
end

group :development do
  gem 'guard'
  gem 'guard-cucumber'
  gem 'guard-rspec'
end

# Better development tools
group :development do
  gem 'better_errors'
  gem 'pry'
end

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

group :development, :test do
  gem 'rspec-rails', '~> 2.99.0'
  gem 'cucumber-rails', '~> 1.4.0', :require => false
  gem 'database_cleaner'
  gem 'webmock'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'ffaker'
end

gem 'rails_serve_static_assets', :group => :production

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use unicorn as the app server
gem 'unicorn'

# Authentication
# Handle SSO authentication and users via Devise and OmniAuth
# There appears to be something broken with hashie >= 3
# which omniauth 1.2.2 allows, so fix at 1.2.1 for now.
# Eventually find what's wrong and resolve this.
gem 'omniauth', '~> 1.2'
gem 'omniauth-saml', '~> 1.2'
gem 'devise'

# Use Capistrano for deployment
group :development do
  gem 'capistrano', '~> 3.1.0'
  gem 'capistrano-rails', '~> 1.1.0'
  gem 'capistrano-bundler'
  gem 'capistrano-rbenv', '~> 2.0'
end

ruby "2.1.2"
