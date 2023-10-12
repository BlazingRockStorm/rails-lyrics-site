# frozen_string_literal: true

class Album < ApplicationRecord
  belongs_to :artist
  has_many :songs, dependent: :nullify

  def increase_visit
    self.views_count += 1
    save!
  end
end
