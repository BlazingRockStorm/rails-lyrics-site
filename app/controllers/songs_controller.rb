# frozen_string_literal: true

class SongsController < ApplicationController
  before_action :set_song, only: :show
  def index
    @songs = Song.all
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
