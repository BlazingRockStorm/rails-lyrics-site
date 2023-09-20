class AddTempoAndLinkToSongs < ActiveRecord::Migration[7.0]
  def change
    add_column :songs, :link, :string
    add_column :songs, :tempo, :bigint
  end
end
