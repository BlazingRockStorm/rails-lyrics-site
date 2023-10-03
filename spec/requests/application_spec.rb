# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Application' do
  describe 'GET /not_found' do
    it 'return the about page' do
      get '/not_found'
      expect(response).to have_http_status(:not_found)
    end
  end
end
