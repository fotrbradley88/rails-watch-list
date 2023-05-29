json.extract! film, :id, :title, :release_year, :genre, :list_id, :created_at, :updated_at
json.url film_url(film, format: :json)
