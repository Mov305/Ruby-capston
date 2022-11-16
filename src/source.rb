class Source
  attr_accessor :name

  def initialize(name)
    @id = Random.rand(1..1100)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.source = self
  end

  private

  attr_reader :id, :items
end
