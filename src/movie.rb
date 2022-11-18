require_relative 'item'

class Movie < Item
  attr_accessor :silent

  def initialize(silent, publish_date, id = Random.rand(1000))
    super(publish_date, id)
    @silent = silent
  end

  def map_item
    {
      id: @id,
      silent: @silent,
      publish_date: @publish_date
    }
  end

  def can_be_archived?
    @silent || super
  end
end
