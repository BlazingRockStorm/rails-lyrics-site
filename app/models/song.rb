# frozen_string_literal: true

class Song < ApplicationRecord
  belongs_to :genre
  has_many :artists, through: :artist_songs
end
