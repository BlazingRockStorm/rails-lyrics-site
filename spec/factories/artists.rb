# frozen_string_literal: true

FactoryBot.define do
  factory :artist do
    sequence(:name) { |n| "Artist#{n}_name" }
    sequence(:biography) { |n| "Artist#{n}_biography" }
  end
end
