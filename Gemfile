source "https://rubygems.org"

gem "rails", "~> 8.0.2"

gem "propshaft"

gem "sqlite3", ">= 2.1"

gem "puma", ">= 5.0"

gem "importmap-rails"

gem "turbo-rails"

gem "stimulus-rails"

gem "jbuilder"

gem "tzinfo-data", platforms: %i[ windows jruby ]

gem "solid_cache"

gem "solid_queue"

gem "solid_cable"

gem 'devise', '~> 4.9', '>= 4.9.3'

gem "bootsnap", require: false

gem "kamal", require: false

gem "thruster", require: false

gem "omniauth"
gem "omniauth-google-oauth2"
gem "omniauth-rails_csrf_protection"

gem 'google_drive', '~> 3.0'
gem 'googleauth'
gem 'faraday'

gem 'sidekiq'

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  gem "brakeman", require: false

  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
