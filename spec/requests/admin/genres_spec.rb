# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin::Genres' do
  before do
    @admin = create(:user)
  end

  describe 'GET #index' do
    describe 'show all genres' do
      before do
        stub_const('Admin::GenresController::PAGE_LIMIT', 3)
        sign_in @admin
      end

      let!(:genres) { create_list(:genre, 4) }

      context 'page 1' do
        before do
          get admin_genres_path, params: { page: 1 }
        end

        it 'show genre 1, genre 2 and genre 3' do
          expect(response).to render_template(:index)
          expect(response.body).to include(genres[0].name, genres[1].name, genres[2].name)
          expect(response.body).not_to include(genres[3].name)
        end
      end

      context 'page 2' do
        before do
          get admin_genres_path, params: { page: 2 }
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

    it "show a genre's json" do
      sign_in @admin
      get admin_genre_path(genre)
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to include('application/json')
      expect(response.body).to include(genre.name)
    end
  end

  describe 'GET #new' do
    it 'leads to new genre page' do
      sign_in @admin
      get new_admin_genre_path
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    it 'creates new genre' do
      sign_in @admin
      post admin_genres_path, params: { genre: { name: 'New Genre' } }
      expect(response).to redirect_to admin_genres_path
      get admin_genres_path
      expect(response.body).to include('New Genre')
    end
  end

  describe 'GET #edit' do
    let(:genre) { create(:genre) }

    it 'leads to edit genre page' do
      sign_in @admin
      get edit_admin_genre_path(genre)
      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT/PATCH #update' do
    let(:genre) { create(:genre) }

    it "edit the genre's name" do
      sign_in @admin
      put admin_genre_path(genre), params: { id: genre.id, genre: { name: 'Editted Genre' } }
      expect(response).to redirect_to admin_genres_path
      get admin_genres_path
      expect(response.body).to include('Editted Genre')
    end
  end

  describe 'DELETE #delete' do
    let(:genre) { create(:genre) }

    it 'destroy the genre' do
      sign_in @admin
      delete admin_genre_path(genre), params: { id: genre.id }
      expect(response).to redirect_to admin_genres_path
      get admin_genres_path
      expect(response.body).not_to include(genre.name)
    end
  end
end
