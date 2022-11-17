require_relative './item'

# Create Game class
class Game < Item
    attr_accessor :multiplayer, :last_played_at, :name
  
    def initialize(publish_date, multiplayer, last_played_at, name)
      super(publish_date)
      @multiplayer = multiplayer
      @last_played_at = last_played_at
      @name = name
    end
  
    def can_be_archieved?
      duration = Date.today.year - @last_played_at.year
      super && duration > 2
    end
  end