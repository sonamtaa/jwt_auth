# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'test@gamil.com' }
    role_id { 1 }
    active { true }
    status { 'approved' }
    password { 'Selise20' }
  end
end
