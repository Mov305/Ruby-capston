class Genre
  attr_accessor :name
  attr_reader :id, :items

  def initialize(name, id = Random.rand(1000))
    @name = name
    @id = id
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.genre = name
  end

  def map_item
    {
      id: @id,
      name: @name,
      items: @items.map(&:map_item)
    }
  end
end
