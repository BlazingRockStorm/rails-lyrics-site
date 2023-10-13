# frozen_string_literal: true

class Song < ApplicationRecord
  belongs_to :genre
  belongs_to :album
  has_many :artists_songs, dependent: :destroy
  has_many :artists, through: :artists_songs
  validates :name, presence: true

  accepts_nested_attributes_for :artists_songs, allow_destroy: true

  scope :sorted_by_id, -> { order(id: :asc) }
  scope :most_viewed, -> { order(views_count: :desc).limit(5) }

  def increase_visit
    self.views_count += 1
    save(validate: false)
  end
end
