require_relative '../game'
require_relative '../author'

class GameUtiles
  def initialize(store)
    @store = store
  end

  def add_game
    print 'Multiplayer: '
    multiplayer = gets.chomp
    print 'Last played at: '
    last_played_at = gets.chomp.split('-').map(&:to_i)
    game = Game.new(multiplayer, Time.new(last_played_at[0], last_played_at[1], last_played_at[2]))
    print 'Do you want to create a new author to this game? (y/n) :'
    answer = gets.chomp.downcase
    if answer == 'y' || @store.authors.length == 0
      puts 'There are no authors yet please create one' if @store.authors.length == 0
      author = create_author
      author.add_item(game)
      @store.add_author(author)
    else
      author = select_author
      author.add_item(game)
      @store.modify_author(author)
    end
    @store.add_game(game)
    puts 'Game added successfully'
  end

  def create_author
    print 'Enter the author first name :'
    first_name = gets.chomp
    print 'Enter the author last name :'
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
  end

  def select_author
    puts 'Select an author'
    @store.authors.each do |author|
      puts "id: #{author.id} - Author name: #{author.first_name} #{author.last_name}"
    end
    author_id = gets.chomp.to_i
    @store.authors.find { |author| author.id == author_id }
  end
end
