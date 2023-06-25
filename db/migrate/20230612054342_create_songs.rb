# frozen_string_literal: true

class CreateSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :songs do |t|
      t.string :name
      t.text :lyric
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
