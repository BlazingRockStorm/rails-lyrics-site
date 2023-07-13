# frozen_string_literal: true

module SongsHelper
  def artists_list(artists)
    artists.map(&:name).join(' x ')
  end
end
