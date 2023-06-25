# frozen_string_literal: true

FactoryBot.define do
  factory :song do
    sequence(:name) { |n| "Song#{n}_name" }
    sequence(:lyric) { |n| "Song#{n}_lyric" }
    genre
  end
end
