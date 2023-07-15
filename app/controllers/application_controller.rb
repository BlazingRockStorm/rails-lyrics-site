# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def not_found
    raise ActionController::RoutingError, 'Not Found'
  rescue StandardError
    render_404
  end

  def render_404
    render file: Rails.public_path.join('404.html').to_s, status: :not_found
  end
end
