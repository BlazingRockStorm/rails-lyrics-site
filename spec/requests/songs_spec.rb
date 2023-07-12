# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Songs' do
  describe 'GET #index' do
    it 'returns http success' do
      get songs_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    let(:song) { create(:song) }

    it 'returns http success' do
      get song_path(song)
      expect(response).to have_http_status(:success)
    end
  end
end
