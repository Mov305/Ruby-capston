require './Classes/game_author'

describe Author do
  let(:author) { Author.new('Stephen') }

  it 'should be an instance of Author' do
    expect(author).to be_an_instance_of(Author)
  end

  it 'should be initialized with a name' do
    expect(author.name).to eq('Stephen')
  end

  it 'should be initialized with an id' do
    expect(author.id).to be_a(String)
  end

  it 'should be initialized with an empty array of items' do
    expect(author.items).to eq([])
  end
end