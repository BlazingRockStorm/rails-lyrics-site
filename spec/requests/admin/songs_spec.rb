# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin::Songs' do
  before do
    @admin = create(:user)
  end

  describe 'GET #index' do
    describe 'show all songs' do
      before do
        stub_const('Admin::SongsController::PAGE_LIMIT', 3)
        sign_in @admin
      end

      let!(:songs) { create_list(:song, 4) }

      context 'page 1' do
        before do
          get admin_songs_path, params: { page: 1 }
        end

        it 'show song 1, song 2 and song 3' do
          expect(response).to render_template(:index)
          expect(response.body).to include(songs[0].name, songs[1].name, songs[2].name)
          expect(response.body).not_to include(songs[3].name)
        end
      end

      context 'page 2' do
        before do
          get admin_songs_path, params: { page: 2 }
        end

        it 'show song 4' do
          expect(response).to render_template(:index)
          expect(response.body).to include(songs[3].name)
          expect(response.body).not_to include(songs[0].name, songs[1].name, songs[2].name)
        end
      end
    end
  end

  describe 'GET #show' do
    let(:song) { create(:song) }

    it "show a song's info" do
      sign_in @admin
      get admin_song_path(song)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(song.name)
      expect(response.body).to include(song.lyric)
      expect(response.body).to include(song.genre.name)
    end
  end

  describe 'GET #new' do
    it 'leads to new song page' do
      sign_in @admin
      get new_admin_song_path
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    let(:genre) { create(:genre) }

    it 'creates new song' do
      sign_in @admin
      post admin_songs_path, params: { song: { name: 'New song', lyric: "Song's lyric", genre: } }
      get admin_songs_path
      expect(response.body).to include('New song')
    end
  end

  describe 'GET #edit' do
    # let(:song) { create(:song) }

    # it 'leads to edit song page' do
    #   sign_in @admin
    #   get edit_admin_song_path(song)
    #   expect(response).to render_template(:edit)
    # end
    skip('Working ...')
  end

  describe 'PUT/PATCH #update' do
    let(:genre) { create(:genre) }
    let(:song) { create(:song) }

    it "edit the song's name" do
      sign_in @admin
      put admin_song_path(song), params: { id: song.id, song: { name: 'Editted song', lyric: 'Editted lyric', genre: } }
      expect(response).to redirect_to admin_song_path(song)
      get admin_song_path(song)
      expect(response.body).to include('Editted song')
      expect(response.body).to include('Editted lyric')
    end
  end

  describe 'DELETE #delete' do
    let(:song) { create(:song) }

    it 'leads to edit song page' do
      sign_in @admin
      delete admin_song_path(song), params: { id: song.id }
      expect(response).to redirect_to admin_songs_path
      get admin_songs_path
      expect(response.body).not_to include(song.name)
      expect(response.body).not_to include(song.lyric)
    end
  end
end
