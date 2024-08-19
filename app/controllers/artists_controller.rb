# frozen_string_literal: true

class ArtistsController < ApplicationController
  before_action :set_artist, only: :show
  PAGE_LIMIT = 10

  def index
    @artists = Artist.page(params[:page]).
               per(PAGE_LIMIT)
  end

  def show
    @albums = @artist.albums
    @songs = @artist.songs.includes([:artists, :genre])
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_artist
    @artist = Artist.find(params[:id])
  end
end
