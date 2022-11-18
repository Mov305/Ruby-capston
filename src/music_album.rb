require_relative './item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :title

  def initialize(publish_date, on_spotify, title, id = Random.rand(1000))
    super(publish_date, id)
    @on_spotify = on_spotify
    @title = title
  end

  def can_be_archived?
    super && @on_spotify == 'Yes'
  end

  def map_item
    {
      publish_date: @publish_date,
      on_spotify: @on_spotify,
      title: @title
    }
  end
end
