# frozen_string_literal: true

class HomeController < ApplicationController
  around_action :skip_bullet, only: :search_results, if: -> { defined?(Bullet) }
  PAGE_LIMIT = 10
  FEATURED_ARTIST = 'ONE OK ROCK'

  def index
    @most_viewed_songs = Song.most_viewed.includes([:artists])
    @most_viewed_albums = Album.most_viewed.includes([:artist])
    @most_popular_artists = Artist.most_popular
    @newest_song = Song.newest_song
    @newest_album = Album.newest_album
    @featured_artist = Artist.find_by(name: FEATURED_ARTIST)
  end

  def search_results
    @searched = params[:target].camelize.constantize.search do
      fulltext params[:search]
      paginate page: params[:page], per_page: PAGE_LIMIT
    end
    @results = @searched.results
  end

  def about; end
end
