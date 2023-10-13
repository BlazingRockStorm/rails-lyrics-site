# frozen_string_literal: true

class Artist < ApplicationRecord
  has_many :albums, dependent: :destroy
  has_many :artists_songs, dependent: :destroy
  has_many :songs, through: :artists_songs
  validates :name, presence: true, uniqueness: true

  scope :sorted_by_id, -> { order(id: :asc) }
end
