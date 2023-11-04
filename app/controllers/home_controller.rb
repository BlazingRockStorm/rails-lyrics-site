# frozen_string_literal: true

class HomeController < ApplicationController
  around_action :skip_bullet, only: :search_results, if: -> { defined?(Bullet) }
  PAGE_LIMIT = 10

  def index
    @most_viewed_songs = Song.most_viewed.includes([:artists])
    @most_viewed_albums = Album.most_viewed.includes([:artist])
    @most_popular_artists = Artist.most_popular
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
