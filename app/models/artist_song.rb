# frozen_string_literal: true

class ArtistSong < ApplicationRecord
  belongs_to :song
  belongs_to :artist
end
