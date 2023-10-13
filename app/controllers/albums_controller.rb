# frozen_string_literal: true

class AlbumsController < ApplicationController
  before_action :set_album, only: :show
  PAGE_LIMIT = 10

  def index
    @albums = Album.includes([:artist]).page(params[:page]).
              per(PAGE_LIMIT)
  end

  def show
    @songs = @album.songs.includes([:artists, :genre])
    @album.increase_visit
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_album
    @album = begin
      Album.find(params[:id])
    rescue StandardError
      not_found
    end
  end
end
