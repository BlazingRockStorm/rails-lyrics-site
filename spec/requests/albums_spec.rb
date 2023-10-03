# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Albums' do
  describe 'GET #index' do
    describe 'show all albums' do
      before do
        stub_const('AlbumsController::PAGE_LIMIT', 3)
      end

      let!(:albums) { create_list(:album, 4) }

      context 'page 1' do
        before do
          get albums_path, params: { page: 1 }
        end

        it 'show album 1, album 2 and album 3' do
          expect(response).to render_template(:index)
          expect(response.body).to include(albums[0].name, albums[1].name, albums[2].name)
          expect(response.body).not_to include(albums[3].name)
        end
      end

      context 'page 2' do
        before do
          get albums_path, params: { page: 2 }
        end

        it 'show album 4' do
          expect(response).to render_template(:index)
          expect(response.body).to include(albums[3].name)
          expect(response.body).not_to include(albums[0].name, albums[1].name, albums[2].name)
        end
      end
    end
  end

  describe 'GET #show' do
    context 'find and return an album' do
      let(:album) { create(:album) }
      # let!(:songs) { create_list(:song, 3, album:) }

      it "show a album's info" do
        get album_path(album)
        expect(response).to have_http_status(:ok)
        expect(response.body).to include(album.name)
        expect(response.body).to include(album.release_year.to_s)
        expect(response.body).to include(album.artist.name)
        # expect(response.body).to include(songs[0].name, songs[1].name, songs[2].name)
      end
    end

    context 'not found and return a album' do
      it 'not found' do
        get album_path(0)
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
