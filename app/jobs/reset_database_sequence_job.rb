# frozen_string_literal: true

class ResetDatabaseSequenceJob < ApplicationJob
  queue_as :low

  def perform(*_args)
    # Do something later
    # sau import, chạy rails c và reset seq:

    %w[users songs artists artists_songs genres albums].each do |tablename|
      ActiveRecord::Base.connection.reset_pk_sequence!(tablename)
    end
  end
end
