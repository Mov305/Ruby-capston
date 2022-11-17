require_relative "../music_album"
require_relative "../genre"

class MusicUtiles
  def initialize(store)
    @store = store
  end

  def add_music_album
    print "Enter the title of the music album :"
    title = gets.chomp
    print "Enter the publish date of the music album :"
    publish_date = gets.chomp
    print "Is the music album on spotify? (y/n) :"
    on_spotify = gets.chomp.downcase == "Yes" ? true : false
    print "Do you want to create a new genre to this music album? (y/n) :"
    answer = gets.chomp.downcase
    music_album = MusicAlbum.new(publish_date, on_spotify, title)
    if answer == "y" || @store.genres.length == 0
      if @store.genres.length == 0
        puts "There are no genres yet please create one"
      end
      genre = create_genre()
      genre.add_item(music_album)
      @store.add_genre(genre)
    else
      genre = select_genre()
      genre.add_item(music_album)
      @store.modify_genre(genre)
    end
    @store.add_music(music_album)
    puts "Music album added successfully"
  end

  def create_genre
    print "Enter the title of the genre :"
    title = gets.chomp
    genre = Genre.new(title)
  end

  def select_genre
    puts "Select a genre"
    @store.genres.each do |genre|
      puts "id: #{genre.id} - Genre name: #{genre.name}"
    end
    genre_id = gets.chomp.to_i
    genre = @store.genres.find { |genre| genre.id == genre_id }
    return genre
  end
end