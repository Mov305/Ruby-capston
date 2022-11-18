class Item
  # rubocop:disable Lint/UnusedMethodArgument
  def initialize(date, id = Random.rand(1000), archived: false)
    @publish_date = date
    @id = id
    @genre = 'N/A'
    @author = 'N/A'
    @source = 'N/A'
    @label = 'N/A'
    @archived = false
  end
  # rubocop:enable Lint/UnusedMethodArgument

  def can_be_archived?
    # return true if the item is older than 10 years # should use a time object
    Time.now.year - @publish_date.year > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_genre(genre)
    @genre = genre
  end

  attr_accessor :id, :genre, :author, :source, :label, :archived
  attr_reader :publish_date
end
