require 'date'
require 'securerandom'

class Item
  attr_accessor :id, :genre, :author, :source, :label, :publish_date, :archived

  def initialize(publish_date)
    @id = SecureRandom.uuid
    @publish_date = Date.parse(publish_date)
    @archived = false
  end

  def can_be_archived?
    current_year = Date.today.year
    difference = current_year - @publish_date.year
    difference >= 10
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  def add_genre(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def add_author(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def add_label(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end
end