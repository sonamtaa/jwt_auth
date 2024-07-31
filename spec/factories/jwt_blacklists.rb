# frozen_string_literal: true

FactoryBot.define do
  factory :jwt_blacklist do
    jti { 'MyString' }
  end
end
