class AddViewsCountToAlbum < ActiveRecord::Migration[7.0]
  def change
    add_column :albums, :views_count, :integer, default: 0
  end
end
