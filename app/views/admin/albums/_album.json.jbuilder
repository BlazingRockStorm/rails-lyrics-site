# frozen_string_literal: true

json.extract! album, :id, :name, :artist_id, :release_year, :created_at, :updated_at
json.url album_url(album, format: :json)
