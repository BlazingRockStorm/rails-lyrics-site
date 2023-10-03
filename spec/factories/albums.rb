# frozen_string_literal: true

FactoryBot.define do
  factory :album do
    sequence(:name) { |n| "Album#{n}_name" }
    release_year { 2000 }
    artist
  end
end
