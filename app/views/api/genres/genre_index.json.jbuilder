json.array! @movies.results do |movie|
  unless movie["poster_path"].nil?
    json.extract!(
      movie,
      'id',
      'title',
      'release_date',
      'vote_average',
      'vote_count',
      'popularity',
      'poster_path',
      'overview'
    )
    json.set! :genre_name, @genre.name
    json.set! :page_num, @movies.page
    json.set! :base_url, @config.base_url
    json.set! :genres do
      json.array! @genres do |genre|
        json.partial! 'api/genres/genre', genre: genre
      end
    end
  end
end
