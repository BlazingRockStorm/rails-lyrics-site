# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Genres' do
  describe 'GET #index' do
    describe 'show all genres' do
      before do
        stub_const('GenresController::PAGE_LIMIT', 3)
      end

      let!(:genres) { create_list(:genre, 4) }

      context 'page 1' do
        before do
          get genres_path, params: { page: 1 }
        end

        it 'show genre 1, genre 2 and genre 3' do
          expect(response).to render_template(:index)
          expect(response.body).to include(genres[0].name, genres[1].name, genres[2].name)
          expect(response.body).not_to include(genres[3].name)
        end
      end

      context 'page 2' do
        before do
          get genres_path, params: { page: 2 }
        end

        it 'show genre 4' do
          expect(response).to render_template(:index)
          expect(response.body).to include(genres[3].name)
          expect(response.body).not_to include(genres[0].name, genres[1].name, genres[2].name)
        end
      end
    end
  end

  describe 'GET #show' do
    let(:genre) { create(:genre) }
    let!(:songs) { create_list(:song, 3, genre:) }

    it "show a genre's info" do
      get genre_path(genre)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(genre.name)
      expect(response.body).to include(songs[0].name, songs[1].name, songs[2].name)
    end
  end
end
