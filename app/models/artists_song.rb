# frozen_string_literal: true

class ArtistsSong < ApplicationRecord
  belongs_to :song
  belongs_to :artist
  enum artist_type: { main: 1, featuring: 2 }
end
