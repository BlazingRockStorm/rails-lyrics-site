class AddMainArtistAndFeaturingArtist < ActiveRecord::Migration[7.0]
  def change
    add_column :artists_songs, :artist_type, :integer
  end
end
