# frozen_string_literal: true

module SongsHelper
  def artists_list(artists)
    artists.joins(:artists_songs).order('artists_songs.artist_type asc').map(&:name).join(' x ')
  end
end
