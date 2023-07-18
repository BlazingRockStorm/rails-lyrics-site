# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin::Artists' do
  before do
    @admin = create(:user)
  end

  describe 'GET #index' do
    let!(:artists) { create_list(:artist, 3) }

    it 'show all artists' do
      sign_in @admin
      get admin_artists_path
      expect(response).to render_template(:index)
      expect(response.body).to include(artists[0].name, artists[1].name, artists[2].name)
    end
  end

  describe 'GET #show' do
    let(:artist) { create(:artist) }

    it "show a artist's info" do
      sign_in @admin
      get admin_artist_path(artist)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(artist.name)
      expect(response.body).to include(artist.biography)
    end
  end

  describe 'GET #new' do
    it 'leads to new artist page' do
      sign_in @admin
      get new_admin_artist_path
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    it 'creates new artist' do
      sign_in @admin
      post admin_artists_path, params: { artist: { name: 'New artist', biography: "Song's biography" } }
      get admin_artists_path
      expect(response.body).to include('New artist')
    end
  end

  describe 'GET #edit' do
    let(:artist) { create(:artist) }

    it 'leads to edit artist page' do
      sign_in @admin
      get edit_admin_artist_path(artist)
      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT/PATCH #update' do
    let(:artist) { create(:artist) }

    it "edit the artist's name" do
      sign_in @admin
      put admin_artist_path(artist), params: { id: artist.id, artist: { name: 'Editted artist', biography: 'Editted biography' } }
      expect(response).to redirect_to admin_artist_path(artist)
      get admin_artist_path(artist)
      expect(response.body).to include('Editted artist')
      expect(response.body).to include('Editted biography')
    end
  end

  describe 'DELETE #delete' do
    let(:artist) { create(:artist) }

    it 'leads to edit artist page' do
      sign_in @admin
      delete admin_artist_path(artist), params: { id: artist.id }
      expect(response).to redirect_to admin_artists_path
      get admin_artists_path
      expect(response.body).not_to include(artist.name)
      expect(response.body).not_to include(artist.biography)
    end
  end
end
