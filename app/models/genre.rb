# frozen_string_literal: true

class Genre < ApplicationRecord
  has_many :songs, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  searchable do
    text :name
  end
end
