# frozen_string_literal: true

class ArtistsSong < ApplicationRecord
  belongs_to :song
  belongs_to :artist
end
