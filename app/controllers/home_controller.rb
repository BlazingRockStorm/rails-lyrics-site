# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @most_viewed_songs = Song.most_viewed.includes([:artists])
    @most_viewed_albums = Album.most_viewed.includes([:artist])
    @most_popular_artists = Artist.most_popular
  end

  def search_results
    @searched = params[:target].camelize.constantize.search do
      fulltext params[:search]
    end
    @results = @searched.results
  end

  def about; end
end
