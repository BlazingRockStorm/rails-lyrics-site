# frozen_string_literal: true

module AlbumSearchable
  extend ActiveSupport::Concern

  included do
    searchable do
      text :name
      integer :release_year
    end
  end
end
