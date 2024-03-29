# frozen_string_literal: true

module Admin
  class SongsController < ApplicationController
    before_action :set_song, only: %i[show edit update destroy]
    before_action :authenticate_user!
    PAGE_LIMIT = 10

    # GET /songs or /songs.json
    def index
      @songs = Song.sorted_by_id.includes(%i[genre artists_songs artists]).
               page(params[:page]).
               per(PAGE_LIMIT)
    end

    # GET /songs/1 or /songs/1.json
    def show; end

    # GET /songs/new
    def new
      @song = Song.new
    end

    # GET /songs/1/edit
    def edit; end

    # POST /songs or /songs.json
    def create
      @song = Song.new(song_params)

      respond_to do |format|
        if @song.save
          format.html { redirect_to admin_song_url(@song), notice: 'Song was successfully created.' }
          format.json { render :show, status: :created, location: @song }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @song.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /songs/1 or /songs/1.json
    def update
      respond_to do |format|
        if @song.update(song_params)
          format.html { redirect_to admin_song_url(@song), notice: 'Song was successfully updated.' }
          format.json { render :show, status: :ok, location: @song }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @song.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /songs/1 or /songs/1.json
    def destroy
      @song.destroy

      respond_to do |format|
        format.html { redirect_to admin_songs_url, notice: 'Song was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def song_params
      params.require(:song).permit(:name, :lyric, :genre_id, :link, :tempo, :album_id,
                                   artists_songs_attributes: [:id, :artist_id, :artist_type, :_destroy])
    end
  end
end
