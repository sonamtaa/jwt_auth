# frozen_string_literal: true

FactoryBot.define do
  factory :role do
    name { 'Admin' }
  end

  trait :employee do
    name { 'Employee' }
  end
end
