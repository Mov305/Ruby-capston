class Label
  def initialize(title, color, id = Random.rand(1000))
    @title = title
    @color = color
    @items = []
    @id = id
  end

  def add_item(item)
    @items.push(item)
    item.label = self
  end

  def map_label
    {
      id: @id,
      title: @title,
      color: @color,
      items: @items.map { |item| item.map_item },
    }
  end

  attr_accessor :title, :color
  attr_reader :items, :id
end
