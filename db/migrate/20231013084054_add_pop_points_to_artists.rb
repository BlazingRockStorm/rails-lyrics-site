class AddPopPointsToArtists < ActiveRecord::Migration[7.0]
  def change
    add_column :artists, :pop_points, :integer, :default => 0
  end
end
