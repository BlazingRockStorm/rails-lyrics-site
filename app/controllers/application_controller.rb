# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from Exception, with: :render_500 # rubocop:disable Naming/VariableNumber

  def not_found
    raise ActionController::RoutingError, 'Not Found'
  rescue StandardError
    render_404
  end

  private

  def skip_bullet
    previous_value = Bullet.enable?
    Bullet.enable = false
    yield
  ensure
    Bullet.enable = previous_value
  end

  # rubocop:disable Naming/VariableNumber
  def render_404
    render file: Rails.public_path.join('404.html').to_s, status: :not_found
  end

  def render_500
    render file: Rails.public_path.join('500.html').to_s, layout: 'application', content_type: 'text/html'
  end
  # rubocop:enable Naming/VariableNumber
end
