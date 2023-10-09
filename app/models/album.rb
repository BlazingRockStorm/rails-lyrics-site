# frozen_string_literal: true

class Album < ApplicationRecord
  belongs_to :artist
  has_many :songs, dependent: :nullify

  searchable do
    text :name
    integer :release_year
  end
end
