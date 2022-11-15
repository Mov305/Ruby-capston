require "json"
require_relative "Book"
require_relative "label"

class Store
  def initialize
    @books = []
    @labels = []
  end

  def add_book(book)
    jsonArr = []
    jsonArr = JSON.parse(File.read("Json/book.json")) if File.exist?("Json/book.json")
    jsonArr.push(book.map_item)
    @books = jsonArr
    file = File.open("Json/book.json", "w")
    file.write(JSON.pretty_generate(jsonArr))
    file.close
  end

  def add_label(label)
    jsonArr = []
    jsonArr = JSON.parse(File.read("Json/label.json")) if File.exist?("Json/label.json")
    jsonArr.push(label.map_item)
    @labels = jsonArr
    file = File.open("Json/label.json", "w")
    file.write(JSON.pretty_generate(jsonArr))
    file.close
  end

  def get_books
    jsonArr = []
    jsonArr = JSON.parse(File.read("Json/book.json")) if File.exist?("Json/book.json")
    jsonArr
  end

  def get_labels
    jsonArr = []
    jsonArr = JSON.parse(File.read("Json/label.json")) if File.exist?("Json/label.json")
    jsonArr
  end
end

# newItem = Book.new("Publisher", Time.new(2001, 1, 1), "not bad")
# store = Store.new
# store.add_book(newItem)

# lab = Label.new("Title", "red")
# lab.add_item(newItem)
# store.add_label(lab)

# p store.get_books
# p store.get_labels
