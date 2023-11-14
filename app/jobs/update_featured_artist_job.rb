# frozen_string_literal: true

class UpdateFeaturedArtistJob < ApplicationJob
  queue_as :low

  def perform(arg)
    # Do something later
    Artist.find_each do |artist|
      artist.featured_artist_flag = false

      artist.save!
    end

    new_featured_artist = Artist.find_by(name: arg)
    new_featured_artist.featured_artist_flag = true
    new_featured_artist.save!
  end
end
