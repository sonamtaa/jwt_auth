# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.4'

gem 'rails', '~> 7.0.2', '>= 7.0.2.3'

gem 'pg', '~> 1.1'
gem 'puma', '5.6.4'

# gem "jbuilder"

# gem "redis", "~> 4.0"

# gem "kredis"

gem 'bcrypt', '~> 3.1.7'
gem 'jwt'

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'bootsnap', require: false

# gem "image_processing", "~> 1.2"

# gem "rack-cors"

group :test do
  gem 'database_cleaner'
  gem 'guard-rspec', require: false
  gem 'mongoid-rspec'
  gem 'rspec-rails', '~> 5.0.0'
  gem 'rubocop-rspec', require: false
  gem 'simplecov', require: false
  gem 'test-prof', '~> 1.0'
end

group :development, :test do
  gem 'brakeman'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry'
  gem 'rubocop', require: false
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubycritic', require: false
end
