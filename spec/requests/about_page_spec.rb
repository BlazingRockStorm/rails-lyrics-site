# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'AboutPages' do
  describe 'GET /about' do
    it 'return the about page' do
      get about_path
      expect(response).to have_http_status(:ok)
    end
  end
end
