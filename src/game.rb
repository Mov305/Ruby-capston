require_relative 'item'

# Create Game class
class Game < Item
  def initialize(multiplayer, last_played_at, id = Random.rand(1000))
    super(id)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def map_item
    {
      id: @id,
      multiplayer: @multiplayer,
      last_played_at: @last_played_at,
      archived: @archived
    }
  end

  def can_be_archieved?
    duration = Time.now.year - @last_played_at.year
    super && duration > 2
  end

  attr_accessor :multiplayer, :last_played_at
end
