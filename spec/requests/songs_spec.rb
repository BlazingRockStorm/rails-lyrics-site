# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Songs' do
  describe 'GET #index' do
    describe 'show all songs' do
      before do
        stub_const('SongsController::PAGE_LIMIT', 3)
      end

      let!(:songs) { create_list(:song, 4) }

      context 'page 1' do
        before do
          get songs_path, params: { page: 1 }
        end

        it 'show song 1, song 2 and song 3' do
          expect(response).to render_template(:index)
          expect(response.body).to include(songs[0].name, songs[1].name, songs[2].name)
          expect(response.body).not_to include(songs[3].name)
        end
      end

      context 'page 2' do
        before do
          get songs_path, params: { page: 2 }
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
    context 'find and return an song' do
      let(:song) { create(:song) }

      it 'returns http success' do
        get song_path(song)
        expect(response).to have_http_status(:success)
        expect(response.body).to include(song.name)
        expect(response.body).to include(song.lyric)
        expect(response.body).to include(song.genre.name)
      end
    end

    context 'not found and return a song' do
      it 'not found' do
        get song_path(0)
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
