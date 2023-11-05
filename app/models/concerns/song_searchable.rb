# frozen_string_literal: true

module SongSearchable
  extend ActiveSupport::Concern

  included do
    searchable do
      text :name, :lyric
      integer :tempo

      text :genre do
        genre.name
      end

      # text :album do
      #   album.name
      # end
    end
  end
end
