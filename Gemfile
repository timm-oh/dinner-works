source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4'

# Frontend
gem 'webpacker', '~> 5'
gem 'turbolinks', '~> 5'
gem "slim-rails", "~> 3.2"

# Authentication
gem "devise", "~> 4.7"
# Authorization
gem "pundit", "~> 2.1"

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Feature Flags
gem "flipper", "~> 0.18.0"
gem "flipper-active_record", "~> 0.18.0"
gem "flipper-ui", "~> 0.18.0"

# User Tracking
gem "field_test", "~> 0.4.0"

# Application Tools
gem "sentry-raven", "~> 3.0"
gem "barnes", "~> 0.0.8"
gem "strong_migrations", "~> 0.7"

group :development, :test do
  gem 'pry'
  gem "bullet", "~> 6.1"
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'letter_opener', '1.7.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "money-rails", "~> 1.13"

gem "blazer", "~> 2.2"

gem "view_component", "~> 2.17"
