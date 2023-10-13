# frozen_string_literal: true

class Album < ApplicationRecord
  belongs_to :artist
  has_many :songs, dependent: :nullify

  scope :sorted_by_id, -> { order(id: :asc) }
  scope :most_viewed, -> { order(views_count: :desc).limit(5) }

  def increase_visit
    self.views_count += 1
    save!
  end
end
