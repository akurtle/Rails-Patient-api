
# frozen_string_literal: true

Devise::JWT.configure do |config|
  config.secret = ENV.fetch("DEVISE_JWT_SECRET_KEY", "dev_only_change_me")
end