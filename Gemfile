# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.3.4'

gem 'active_model_serializers'
gem 'bcrypt'
gem 'bootsnap', require: false
gem 'jwt'
gem 'pg'
gem 'puma'
gem 'rails', '~> 7.1.3'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
group :test do
  gem 'database_cleaner'
  gem 'guard-rspec', require: false
  gem 'mongoid-rspec'
  gem 'rspec-rails'
  gem 'rubocop-rspec', require: false
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'test-prof'
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
