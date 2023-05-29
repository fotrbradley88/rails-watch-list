require 'httparty'
require 'JSON'
# Fetch popular movies from TMDb API
response = HTTParty.get('https://api.themoviedb.org/3/movie/popular?api_key=161d56adfa6cfc0e3e7c646fa6f4e995')

# Extract movie details from the API response
movies = JSON.parse(response.body)['results']

# Seed movies
movies.each do |movie_data|
  Movie.create(
    title: movie_data['title'],
    description: movie_data['overview']
  )
end

# Seed lists
3.times do
  list = List.create(
    name: Faker::Lorem.word,
    image_url: Faker::LoremPixel.image(size: '300x400', category: 'abstract')
  )

  # Seed bookmarks
  5.times do
    movie = Movie.all.sample
    bookmark = list.bookmarks.create(movie: movie)
    bookmark.update(
      title: Faker::Lorem.sentence,
      description: Faker::Lorem.paragraph
    )
  end
end
