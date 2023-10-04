class AddReleaseYearToAlbum < ActiveRecord::Migration[7.0]
  def change
    add_column :albums, :release_year, :bigint
  end
end
