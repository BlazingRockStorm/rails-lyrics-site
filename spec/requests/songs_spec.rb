# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Songs' do
  describe 'GET #index' do
    let!(:songs) { create_list(:song, 3) }

    it 'returns http success' do
      get songs_path
      expect(response.body).to include(songs[0].name, songs[1].name, songs[2].name)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    let(:song) { create(:song) }

    it 'returns http success' do
      get song_path(song)
      expect(response).to have_http_status(:success)
      expect(response.body).to include(song.name)
      expect(response.body).to include(song.lyric)
      expect(response.body).to include(song.genre.name)
    end
  end
end
