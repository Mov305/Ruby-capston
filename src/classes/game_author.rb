require 'securerandom'
require_relative 'item'

# Create an Author class with an association to the Item class
class Author
  attr_accessor :id, :name, :items

  def initialize(name)
    @id = SecureRandom.uuid
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.add_genre(self)
  end
end