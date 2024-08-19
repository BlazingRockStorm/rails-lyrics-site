# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def skip_bullet
    previous_value = Bullet.enable?
    Bullet.enable = false
    yield
  ensure
    Bullet.enable = previous_value
  end
end
