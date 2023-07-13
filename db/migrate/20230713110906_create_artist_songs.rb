# frozen_string_literal: true

class CreateArtistSongs < ActiveRecord::Migration[7.0]
  def change
    create_join_table :songs, :artists
  end
end
