# frozen_string_literal: true

module GenreSearchable
  extend ActiveSupport::Concern

  included do
    searchable do
      text :name
    end
  end
end
