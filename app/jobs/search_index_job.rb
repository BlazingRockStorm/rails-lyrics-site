# frozen_string_literal: true

class SearchIndexJob < ApplicationJob
  queue_as :low

  def perform(*_args)
    [Song, Artist, Genre, Album].each(&:reindex)
  end
end
