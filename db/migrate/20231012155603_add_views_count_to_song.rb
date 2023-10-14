class AddViewsCountToSong < ActiveRecord::Migration[7.0]
  def change
    add_column :songs, :views_count, :integer, default: 0
  end
end
