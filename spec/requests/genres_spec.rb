# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Genres' do
  describe 'GET #index' do
    let!(:genres) { create_list(:genre, 4) }

    it 'show all genres' do
      get genres_path
      expect(response).to render_template(:index)
      expect(response.body).to include(genres[0].name, genres[1].name, genres[2].name)
    end
  end

  describe 'GET #show' do
    let(:genre) { create(:genre) }

    it "show a genre's info" do
      get genre_path(genre)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(genre.name)
    end
  end
end
