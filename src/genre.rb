class Genre {

    attr_accessor :name, :items
    attr_reader :id

    def initialize(name)
        @name = name
        @id = Random.rand(1000)
        @items = []
    end

    def add_item(item){
        # add item to the genre
        @items.push(item)
    }


}