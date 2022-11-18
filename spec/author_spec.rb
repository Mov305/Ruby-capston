require_relative 'helper_spec'

describe Author do
  before :each do
    @author = Author.new('Author', 'loca', 'bio')
  end

  it 'should be an instance of Author' do
    expect(@author).to be_an_instance_of(Author)
  end

  it 'should be initialized with a name' do
    expect(@author.first_name).to eq('Author')
  end

  it 'should be initialized with an id' do
    expect(@author.id).to be_a(String)
  end

  it 'should be initialized with an empty array of items' do
    expect(@author.items).to eq([])
  end
end
