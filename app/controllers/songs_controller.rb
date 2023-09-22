# frozen_string_literal: true

class SongsController < ApplicationController
  before_action :set_song, only: :show
  PAGE_LIMIT = 10

  def index
    @songs = Song.includes(%i[genre artists_songs artists]).
             page(params[:page]).
             per(PAGE_LIMIT)
  end

  def show; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_song
    @song = begin
      Song.find(params[:id])
    rescue StandardError
      not_found
    end
  end
end
