class AddPrimaryKeyForArtistsSong < ActiveRecord::Migration[7.0]
  def change
    add_column :artists_songs, :id, :primary_key
  end
end
