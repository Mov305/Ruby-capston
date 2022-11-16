require_relative 'item'

class Movie < Item
  attr_accessor :silent

  def initialize(silent, publish_date, archived)
    super(publish_date, archived)
    @silent = silent
  end

  private

  def can_be_archived?
    @silent || super
  end
end
