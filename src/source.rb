class Source
  attr_accessor :name

  def initialize(name, id = Random.rand(1000))
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.source = self
  end

  def map_item
    {
      id: @id,
      name: @name,
      items: @items.map(&:map_item)
    }
  end

  attr_reader :id, :items
end
