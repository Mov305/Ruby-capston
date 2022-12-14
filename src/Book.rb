require_relative 'item'
# require_relative "label"

class Book < Item
  def initialize(publisher, publish_date, cover_state, id = Random.rand(1000))
    super(publish_date, id)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    @cover_state == 'bad' or super
  end

  def map_item
    {
      id: @id,
      publisher: @publisher,
      publish_date: @publish_date,
      cover_state: @cover_state,
      label: @label
    }
  end

  attr_accessor :publisher, :cover_state, :id
end
