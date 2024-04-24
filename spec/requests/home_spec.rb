# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'HomePage' do
  describe 'GET /' do
    pending "add some examples to (or delete) #{__FILE__}"
    # it 'return the home page' do
    #   get home_path
    #   expect(response).to have_http_status(:ok)
    # end
  end

  describe 'GET /about' do
    it 'return the about page' do
      get about_path
      expect(response).to have_http_status(:ok)
    end
  end
end
