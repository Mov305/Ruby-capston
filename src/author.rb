class Author
  attr_accessor :id, :first_name, :last_name, :items

  def initialize(firstname, lastname, id = Random.rand(1000))
    @id = id
    @first_name = firstname
    @last_name = lastname
    @items = []
  end

  def map_item
    {
      id: @id,
      first_name: @first_name,
      last_name: @last_name,
      items: @items.map(&:map_item)
    }
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.author = "#{first_name} #{last_name}"
  end
end
