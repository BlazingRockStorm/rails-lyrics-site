# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin::Albums' do
  before do
    @admin = create(:user)
  end

  describe 'GET #index' do
    describe 'show all albums' do
      before do
        stub_const('Admin::AlbumsController::PAGE_LIMIT', 3)
        sign_in @admin
      end

      let!(:albums) { create_list(:album, 4) }

      context 'page 1' do
        before do
          get admin_albums_path, params: { page: 1 }
        end

        it 'show album 1, album 2 and album 3' do
          expect(response).to render_template(:index)
          expect(response.body).to include(albums[0].name, albums[1].name, albums[2].name)
          expect(response.body).not_to include(albums[3].name)
        end
      end

      context 'page 2' do
        before do
          get admin_albums_path, params: { page: 2 }
        end

        it 'show album 4' do
          expect(response).to render_template(:index)
          expect(response.body).not_to include(albums[0].name, albums[1].name, albums[2].name)
          expect(response.body).to include(albums[3].name)
        end
      end
    end
  end

  describe 'GET #show' do
    let(:album) { create(:album) }

    it "show a album's info" do
      sign_in @admin
      get admin_album_path(album)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(album.name)
      expect(response.body).to include(album.artist.name)
      expect(response.body).to include(album.release_year.to_s)
    end
  end

  describe 'GET #new' do
    it 'leads to new album page' do
      sign_in @admin
      get new_admin_album_path
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    it 'creates new album' do
      sign_in @admin
      post admin_albums_path, params: { album: { name: 'New album', release_year: 2001 } }
      get admin_albums_path
      expect(response.body).to include('New album')
    end
  end

  describe 'GET #edit' do
    let(:album) { create(:album) }

    it 'leads to edit album page' do
      sign_in @admin
      get edit_admin_album_path(album)
      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT/PATCH #update' do
    let(:album) { create(:album) }

    it "edit the album's name" do
      sign_in @admin
      put admin_album_path(album), params: { id: album.id, album: { name: 'Editted album', release_year: 2001 } }
      expect(response).to redirect_to admin_album_path(album)
      get admin_album_path(album)
      expect(response.body).to include('Editted album')
      expect(response.body).to include('2001')
    end
  end

  describe 'DELETE #delete' do
    let(:album) { create(:album) }

    it 'leads to edit album page' do
      sign_in @admin
      delete admin_album_path(album), params: { id: album.id }
      expect(response).to redirect_to admin_albums_path
      get admin_albums_path
      expect(response.body).not_to include(album.name)
    end
  end
end
