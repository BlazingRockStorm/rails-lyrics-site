# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Artists' do
  describe 'GET #index' do
    describe 'show all artists' do
      before do
        stub_const('ArtistsController::PAGE_LIMIT', 3)
      end

      let!(:artists) { create_list(:artist, 4) }

      context 'page 1' do
        before do
          get artists_path, params: { page: 1 }
        end

        it 'show artist 1, artist 2 and artist 3' do
          expect(response).to render_template(:index)
          expect(response.body).to include(artists[0].name, artists[1].name, artists[2].name)
          expect(response.body).not_to include(artists[3].name)
        end
      end

      context 'page 2' do
        before do
          get artists_path, params: { page: 2 }
        end

        it 'show artist 4' do
          expect(response).to render_template(:index)
          expect(response.body).to include(artists[3].name)
          expect(response.body).not_to include(artists[0].name, artists[1].name, artists[2].name)
        end
      end
    end
  end

  describe 'GET #show' do
    context 'find and return an artist' do
      let(:artist) { create(:artist) }
      let!(:songs) { create_list(:song, 3, artists: [artist]) }
      let!(:albums) { create_list(:album, 3, artist:) }

      it "show a artist's info" do
        get artist_path(artist)
        expect(response).to have_http_status(:ok)
        expect(response.body).to include(artist.name)
        expect(response.body).to include(artist.biography)
        expect(response.body).to include(songs[0].name, songs[1].name, songs[2].name)
        expect(response.body).to include(albums[0].name, albums[1].name, albums[2].name)
      end
    end

    context 'not found and return an artist' do
      it 'not found' do
        get artist_path(0)
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
