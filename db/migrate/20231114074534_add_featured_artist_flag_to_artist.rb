class AddFeaturedArtistFlagToArtist < ActiveRecord::Migration[7.0]
  def change
    add_column :artists, :featured_artist_flag, :boolean, :default => false
  end
end
