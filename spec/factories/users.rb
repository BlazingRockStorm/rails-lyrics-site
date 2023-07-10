# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'Admin@email.com' }
    password { 'Admin@123' }
  end
end
