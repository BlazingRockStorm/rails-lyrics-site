class AddPopPointsToArtists < ActiveRecord::Migration[7.0]
  def change
    add_column :artists, :albums_points, :integer, :default => 0
    add_column :artists, :songs_points, :integer, :default => 0
  end
end
