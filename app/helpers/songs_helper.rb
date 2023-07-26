# frozen_string_literal: true

module SongsHelper
  def artists_list(artists)
    # artists = artists.joins(:artists_songs).order('artists_songs.artist_type asc') if artists.count > 1
    artists.map(&:name).join(' x ')
  end
end
