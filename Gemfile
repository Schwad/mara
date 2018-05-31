source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby '2.4.4'
gem 'rails', '~> 5.2.0'
gem 'bootswatch-rails'
gem 'bundle-audit'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'coveralls', require: false
gem 'turbolinks', '~> 5'
gem 'interactor-rails', '~> 2.0'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'rainbow', '~> 2.2.2'
gem 'sdoc'
gem 'sidekiq'
gem 'stripe'
gem 'telegram_bot', git: 'https://github.com/schwad/telegram_bot'
gem 'wunderground'
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end
group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'brakeman', :require => false
end
group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'simplecov', require: false
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'bootstrap-sass'
gem 'devise'
gem 'jquery-rails'
gem 'pg'
gem 'simple_form'
gem 'reek'
group :development do
  gem 'better_errors'
  gem 'rails_layout'
  gem 'spring-commands-rspec'
end
group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'rspec-rails'
  gem 'rubocop'
end
group :test do
  gem 'database_cleaner'
  gem 'launchy'
  gem 'pronto'
  gem 'pronto-fasterer', require: false
  gem 'pronto-reek', require: false
  gem 'pronto-rubocop', require: false
end
