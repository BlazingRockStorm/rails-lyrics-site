# frozen_string_literal: true

class Song < ApplicationRecord
  belongs_to :genre
  has_many :artists_songs, dependent: :destroy
  has_many :artists, through: :artists_songs
  validates :name, presence: true
end
