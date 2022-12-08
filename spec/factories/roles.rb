# frozen_string_literal: true

FactoryBot.define do
  factory :role do
    id { 1 }
    name { 'Admin' }
  end

  trait :employee do
    id { 3 }
    name { 'Employee' }
  end
end
