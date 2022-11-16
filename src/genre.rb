class Genre
  attr_accessor :name
  attr_reader :id, :items

  def initialize(name)
    @name = name
    @id = Random.rand(1000)
    @items = []
  end

  def add_item(item)
    @items.push(item)
   # @items.push(item) unless @items.include?(item)
   # item.genre = self
  end

  def map_item
    {
      name: @name
    }
  end
end
