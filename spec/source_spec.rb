require_relative "../src/source"

describe Source do
  context 'When instantiated' do
    before(:all) do
      @source = Source.new('Grace')
    end

    it 'Should be an instance of class Source' do
      expect(@source).to be_an_instance_of(Source)
    end

    it 'Should return name' do
      expect(@source.name).to eq 'Grace'
    end
  end
end