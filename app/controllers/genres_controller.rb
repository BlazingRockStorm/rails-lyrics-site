# frozen_string_literal: true

class GenresController < ApplicationController
  before_action :set_genre, only: :show
  PAGE_LIMIT = 10

  def index
    @genres = Genre.page(params[:page]).
              per(PAGE_LIMIT)
  end

  def show
    @songs = @genre.songs.includes([:artists])
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_genre
    @genre = begin
      Genre.find(params[:id])
    rescue StandardError
      not_found
    end
  end
end
