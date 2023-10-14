# frozen_string_literal: true

class UpdateArtistPopPointsJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    # Do something later
    Artist.all.each do |artist|
      artist.songs_points = 0
      artist.albums_points = 0

      artist.albums.each do |album|
        artist.albums_points += album.views_count
      end

      artist.songs.each do |song|
        artist.songs_points += song.views_count
      end

      artist.save!
    end
  end
end
