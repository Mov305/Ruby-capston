require_relative '../Book'
require_relative '../label'

class BookUtiles
  def initialize(store)
    @store = store
  end

  def add_book()
    print 'Enter the author of the book :'
    author = gets.chomp
    print 'Enter the publisher of the book :'
    publisher = gets.chomp
    print 'Enter the date of the book :'
    date = gets.chomp.split('-').map(&:to_i)
    print 'Enter the cover state of the book :'
    cover_state = gets.chomp
    book = Book.new(publisher, Time.new(date[0], date[1], date[2]), cover_state)
    book.author = author
    print 'Do you want to create a label to this book? (y/n)'
    answer = gets.chomp.downcase
    if answer == 'y' || @store.labels.length.zero?
      puts 'There are no labels yet please create one' if @store.labels.length.zero?
      lab = create_label
      lab.add_item(book)
      @store.add_label(lab)
    else
      lab = select_label
      lab.add_item(book)
      @store.modify_label(lab)
    end
    @store.add_book(book)
    puts 'Book added successfully'
  end

  def create_label()
    print 'Enter the title of the label :'
    title = gets.chomp
    print 'Enter the color of the label :'
    color = gets.chomp
    label = Label.new(title, color)
  end

  def select_label()
    puts 'Select a label'
    @store.labels.each do |label|
      puts "id: #{label.id} - Label title: #{label.title} - Label color: #{label.color}"
    end
    label_id = gets.chomp.to_i
    @store.labels.find { |label| label.id == label_id }
  end
end

# def add_music(store)
#   @publish_date = []
#   puts 'Please Enter Title of Music Album: '
#   title = gets.chomp

#   loop do
#     puts 'Please Enter the Public Date - Format(YYYY-MM-DD): '
#     @publish_date = gets.chomp
#     break if date_validation(@publish_date)

#     puts 'INVALID DATE:  please enter a valid date'
#   end
#   puts 'Is the music album on Spotify? (true/false)'
#   on_spotify = on_spotify_prompt

#   music = MusicAlbum.new(@publish_date, on_spotify, title)
#   # @music_albums.push(music)
#   puts 'I got here7'
#   store.add_music(music)
#   puts 'Music album added successfully'
#   puts ''
# end

# def on_spotify_prompt
#   while true
#     print 'Is it spotify? Select 1 for Yes, 2 for No: '
#     on_spotify = gets.chomp.to_i

#     case on_spotify
#     when 1 then on_spotify = 'yes'
#     when 2 then on_spotify = 'no'
#     else
#       puts 'Please enter a valid option'
#       next
#     end
#     break
#   end
#   on_spotify
# end

# def add_genre(store)
#   puts "Please enter the genre of the music album: "
#   name = gets.chomp
#   genre = Genre.new(name)
#   store.add_genre(genre)
#   puts "Genre: \"#{genre.name}\" was added successfully"
# end
