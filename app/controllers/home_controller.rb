# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @most_viewed_songs = Song.most_viewed.includes([:artists])
    @most_viewed_albums = Album.most_viewed.includes([:artist])
  end

  def about; end
end
