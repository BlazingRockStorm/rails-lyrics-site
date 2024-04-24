# frozen_string_literal: true

class Artist < ApplicationRecord
  # include ArtistSearchable

  has_many :albums, dependent: :destroy
  has_many :artists_songs, dependent: :destroy
  has_many :songs, through: :artists_songs
  validates :name, presence: true, uniqueness: true

  scope :sorted_by_id, -> { order(id: :asc) }
  scope :most_popular, -> { order(songs_points: :desc).order(albums_points: :desc).limit(5) }
end
