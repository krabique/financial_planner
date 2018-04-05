# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'carrierwave', '~> 1.0'
gem 'cells-rails'
gem 'cells-slim'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'enumerize'
gem 'jbuilder', '~> 2.5'
gem 'kaminari'
gem 'money-rails', '~> 1.10'
gem 'omniauth-github'
gem 'omniauth-google-oauth2'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'pundit'
gem 'rails', '~> 5.1.4'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'reform'
gem 'reform-rails'
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'slim'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker', '~> 3.2'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'reek', require: false
  gem 'rspec-rails', '~> 3.7'
  gem 'rubocop', '~> 0.52.1', require: false
  gem 'rubocop-rspec'
  gem 'selenium-webdriver'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'faker'
  gem 'i18n-tasks', '~> 0.9.21'
  gem 'rspec_junit_formatter'
  gem 'shoulda-matchers', '~> 3.1'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
