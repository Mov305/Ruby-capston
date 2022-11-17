class Item
  def initialize(date, id = Random.rand(1000), archived: false)
    @publish_date = date
    @id = id
    @genre = 'N/A'
    @author = 'N/A'
    @source = 'N/A'
    @label = 'N/A'
    @archived = false
  end

  def can_be_archived?
    # return true if the item is older than 10 years # should use a time object
    Time.now.year - @publish_date.year > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
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

  attr_accessor :id, :genre, :author, :source, :label, :archived
  attr_reader :publish_date
end

# newItem = Item.new(Time.new(2021, 1, 1))
# puts newItem.can_be_archived?
# newItem.move_to_archive
# newItem.author = "Author"
# p newItem.inspect
