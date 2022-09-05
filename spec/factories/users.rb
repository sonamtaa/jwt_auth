# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'test@gamil.com' }
    name { 'Sonam Testing' }
    username { 'sonamtaahee' }
    # role_id { 1 }
    # active { true }
    # status { 'approved' }
    password { 'Selise20' }
  end

  trait :employees do
    email { 'employee@gamil.com' }
    name { 'Employee Testing' }
    username { 'employeetaa' }
  end
end
