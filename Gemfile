# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.0'

gem 'active_model_serializers'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', require: false
gem 'jwt'
gem 'pg', '~> 1.1'
gem 'puma', '5.6.2'
gem 'rails', '~> 7.0.2', '>= 7.0.2.3'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
group :test do
  gem 'database_cleaner'
  gem 'guard-rspec', require: false
  gem 'mongoid-rspec'
  gem 'rspec-rails', '~> 5.0.0'
  gem 'rubocop-rspec', require: false
  gem 'shoulda-matchers', '~> 3.1'
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
