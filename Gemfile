source "https://rubygems.org"

ruby "3.4.8"

gem "rails", "~> 7.1.0"
gem "pg", "~> 1.5"
gem "puma", ">= 5.0"
gem "rack-cors"

gem "bootsnap", require: false

# Auth
gem "devise"
gem "devise-jwt"

# Authorization (RBAC)
gem "pundit"

# Quality
gem "dotenv-rails"

group :development, :test do
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "faker"
end

group :test do
  gem "database_cleaner-active_record"
end