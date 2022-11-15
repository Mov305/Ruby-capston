require_relative "storage"
require_relative "Book"
require_relative "label"

def add_book(store)
  print "Enter the author of the book :"
  author = gets.chomp
  print "Enter the publisher of the book :"
  publisher = gets.chomp
  print "Enter the date of the book :"
  date = gets.chomp
  print "Enter the cover state of the book :"
  cover_state = gets.chomp
  book = Book.new(publisher, date, cover_state)
  book.author = author
  store.add_book(book)
  puts "Book added successfully"
end

def add_label(store)
  print "Enter the title of the label :"
  title = gets.chomp
  print "Enter the color of the label :"
  color = gets.chomp
  label = Label.new(title, color)
  store.add_label(label)
  puts "Label added successfully"
end
