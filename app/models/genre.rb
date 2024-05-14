# frozen_string_literal: true

class Genre < ApplicationRecord
  searchkick

  has_many :songs, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  scope :sorted_by_id, -> { order(id: :asc) }
end
