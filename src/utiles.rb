require_relative 'storage'
require_relative 'Book'
require_relative 'label'
require_relative 'date_validation'
require_relative 'music_album'
require_relative 'genre'


def add_book(store)
  print 'Enter the author of the book :'
  author = gets.chomp
  print 'Enter the publisher of the book :'
  publisher = gets.chomp
  print 'Enter the date of the book :'
  date = gets.chomp
  print 'Enter the cover state of the book :'
  cover_state = gets.chomp
  book = Book.new(publisher, date, cover_state)
  book.author = author
  store.add_book(book)
  puts 'Book added successfully'
end

def add_label(store)
  print 'Enter the title of the label :'
  title = gets.chomp
  print 'Enter the color of the label :'
  color = gets.chomp
  label = Label.new(title, color)
  store.add_label(label)
  puts 'Label added successfully'
end

def add_music(store)
  @publish_date = []
  puts 'Please Enter Title of Music Album: '
  title = gets.chomp

  loop do
    puts 'Please Enter the Public Date - Format(YYYY-MM-DD): '
    @publish_date = gets.chomp
    break if date_validation(@publish_date)

    puts 'INVALID DATE:  please enter a valid date'
  end
  puts 'Is the music album on Spotify? (true/false)'
  on_spotify = on_spotify_prompt

  music = MusicAlbum.new(@publish_date, on_spotify, title)
  # @music_albums.push(music)
  puts 'I got here7'
  store.add_music(music)
  puts 'Music album added successfully'
  puts ''
end

def on_spotify_prompt
  while true
    print 'Is it spotify? Select 1 for Yes, 2 for No: '
    on_spotify = gets.chomp.to_i

    case on_spotify
    when 1 then on_spotify = 'yes'
    when 2 then on_spotify = 'no'
    else
      puts 'Please enter a valid option'
      next
    end
    break
  end
  on_spotify
end


def add_genre(store)
  puts 'Please enter the genre of the music album: '
  name = gets.chomp
  genre = Genre.new(name)
  store.add_genre(genre)
  puts "Genre: \"#{genre.name}\" was added successfully"
end
