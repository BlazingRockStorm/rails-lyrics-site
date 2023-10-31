class AddForeignKeysForArtistsSongs < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :artists_songs, :artists
    add_foreign_key :artists_songs, :songs
  end
end
