# frozen_string_literal: true

class Artist < ApplicationRecord
  has_many :artists_songs, dependent: :destroy
  has_many :songs, through: :artists_songs
end
