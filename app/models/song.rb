# frozen_string_literal: true

class Song < ApplicationRecord
  belongs_to :genre
  belongs_to :album
  has_many :artists_songs, dependent: :destroy
  has_many :artists, through: :artists_songs
  validates :name, presence: true

  accepts_nested_attributes_for :artists_songs, allow_destroy: true

  searchable do
    text :name, :lyrics
    integer :tempo

    # text :genre do
    #   genre.name
    # end

    # text :album do
    #   album.name
    # end
  end
end
