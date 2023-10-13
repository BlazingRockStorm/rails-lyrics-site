# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @most_viewed_songs = Song.most_viewed
    @most_viewed_albums = Album.most_viewed
  end

  def about; end
end
