# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def not_found
    raise ActionController::RoutingError, 'Not Found'
  rescue StandardError
    render404
  end

  private

  def skip_bullet
    previous_value = Bullet.enable?
    Bullet.enable = false
    yield
  ensure
    Bullet.enable = previous_value
  end

  def render404
    render file: Rails.public_path.join('404.html').to_s, status: :not_found
  end
end
