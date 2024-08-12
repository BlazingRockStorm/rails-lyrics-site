# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UpdateArtistPopPointsJob do
  describe 'perform_later' do
    it 'enqueue job' do
      ActiveJob::Base.queue_adapter = :test
      described_class.perform_later
      expect(described_class).to have_been_enqueued
    end
  end
end
