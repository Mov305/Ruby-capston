require_relative '../movie'
require_relative '../file_writer'
require_relative '../file_reader'

def write_movies(movies)
  data = []
  movies.each do |movie|
    data << { silent: movie.silent, publish_date: movie.publish_date }
  end
  file_writer = FileWriter.new(data, 'movies.json')
  file_writer.write
end

def read_movies
  file_reader = FileReader.new('movies.json')
  content = file_reader.read
  content.map do |movie|
    Movie.new(movie['silent'], movie['publish_date'])
  end
end
