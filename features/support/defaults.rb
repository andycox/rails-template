# env.rb says don't edit, so we won't

# Use FactoryGirl and shortcuts
World(FactoryGirl::Syntax::Methods)

# We're Rails 4.1 so we can do this
ActiveRecord::Migration.maintain_test_schema!
