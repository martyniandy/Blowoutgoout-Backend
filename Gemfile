source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

gem 'rails', '~> 5.2.0'
gem 'pg'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'
gem 'simple_command', '0.0.9'
gem 'jwt', '1.5.6'
gem 'rolify'
gem 'bcrypt', '~> 3.1.7'
gem 'bulma-extensions-rails'
gem 'bulma-rails', '~> 0.7.2'
gem 'font-awesome-sass', '~> 5.5.0'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'rack-cors', :require => 'rack/cors'
gem 'active_model_serializers', '~> 0.10.0'
gem 'omniauth-facebook'
gem 'pundit', '2.0.1'
gem 'geokit-rails', '2.3.1'
gem "aws-sdk-s3", '1.9.1', require: false
gem 'image_processing', '1.8.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
