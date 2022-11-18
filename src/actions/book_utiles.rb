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
    Label.new(title, color)
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
