# frozen_string_literal: true

module ArtistSearchable
  extend ActiveSupport::Concern

  included do
    searchable do
      text :name
      text :biography
    end
  end
end
