require_relative 'helper_spec'

describe Book do
  before :each do
    @book = Book.new('Publisher', Time.new(2001, 1, 1), 'bad')
  end

  it 'The book should be an instance of the Book class' do
    expect(@book).to be_an_instance_of Book
  end

  it 'The book should be able to be archived' do
    expect(@book.can_be_archived?).to be true
  end

  it 'The book should be able to be mapped' do
    expect(@book.map_book).to be_a Hash
  end
end
