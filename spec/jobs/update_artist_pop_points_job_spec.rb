# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UpdateArtistPopPointsJob do
  let!(:artist) { create(:artist) }
  let!(:album) { create(:album, artist:, views_count: 1) }
  let!(:song) { create(:song, album:, artists: [artist], views_count: 2) } # rubocop:disable RSpec/LetSetup

  describe 'perform_later' do
    it 'enqueue job' do
      ActiveJob::Base.queue_adapter = :test
      described_class.perform_later
      expect(described_class).to have_been_enqueued
    end

    it "update artist's points" do
      described_class.perform_now
      artist.reload
      expect(artist.songs_points).to eq(2)
      expect(artist.albums_points).to eq(1)
    end
  end
end
