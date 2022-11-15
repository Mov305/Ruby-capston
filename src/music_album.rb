require_relative './item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :title
  attr_reader :archived

  def initialize(publish_date, on_spotify, title, archived: false)
    super(publish_date, id, archived)
    @on_spotify = on_spotify
    @title = title
    @archived = archived
  end

  def can_be_archived?
    @on_spotify == 'Yes'
  end
end
