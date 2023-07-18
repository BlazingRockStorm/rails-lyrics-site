# frozen_string_literal: true

class GenresController < ApplicationController
  before_action :set_genre, only: :show
  def index
    @genres = Genre.all
  end

  def show; end

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
