# frozen_string_literal: true

class Album < ApplicationRecord
  belongs_to :artist
  has_many :songs, dependent: :nullify
end
