# frozen_string_literal: true

FactoryBot.define do
  factory :album do
    sequence(:name) { |n| "Album#{n}_name" }
    artist
  end
end
