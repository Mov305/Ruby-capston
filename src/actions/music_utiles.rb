require_relative '../music_album'
require_relative '../genre'

class MusicUtiles
  def initialize(store)
    @store = store
  end

  def add_music_album
    print 'Enter the title of the music album :'
    title = gets.chomp
    print 'Enter the publish date of the music album (yyyy-mm-dd) :'
    publish_date = gets.chomp.split('-').map(&:to_i)
    print 'Is the music album on spotify? (y/n) :'
    on_spotify = gets.chomp.downcase == 'Yes'
    print 'Do you want to create a new genre to this music album? (y/n) :'
    answer = gets.chomp.downcase
    music_album = MusicAlbum.new(Time.new(publish_date[0], publish_date[1], publish_date[2]), on_spotify, title)
    if answer == 'y' || @store.genres.length.zero?
      puts 'There are no genres yet please create one' if @store.genres.length.zero?
      genre = create_genre
      genre.add_item(music_album)
      @store.add_genre(genre)
    else
      genre = select_genre
      genre.add_item(music_album)
      @store.modify_genre(genre)
    end
    @store.add_music(music_album)
    puts 'Music album added successfully'
  end

  def create_genre
    print 'Enter the title of the genre :'
    title = gets.chomp
    Genre.new(title)
  end

  def select_genre
    puts 'Select a genre'
    @store.genres.each do |genre|
      puts "id: #{genre.id} - Genre name: #{genre.name}"
    end
    genre_id = gets.chomp.to_i
    @store.genres.find { |genre| genre.id == genre_id }
  end
end
