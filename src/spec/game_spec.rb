require_relative 'helper_spec'

describe Game do
  before :each do
    @game = Game.new(true, Time.new(2001, 1, 1), 'id')
  end

  it 'should be a game' do
    expect(@game).to be_an_instance_of(Game)
  end

  it 'should be multiplayer' do
    expect(@game.multiplayer).to eq(true)
  end

  it 'should have a last_played_at date' do
    expect(@game.last_played_at).to eq(Time.new(2001, 1, 1))
  end

  it "shouldn't be archived" do
    expect(@game.archived).to eq(false)
  end
end
