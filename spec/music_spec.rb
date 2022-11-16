require_relative 'helper_spec'
require 'date'

#-initialize(publish_date, on_spotify, title, archived: false)

describe MusicAlbum do
    before :each do
      @music = MusicAlbum.new('2010-02-12', true, "Governance", false)
    end
  
    it 'music should be an instance of Music class' do
      expect(@music).to be_an_instance_of MusicAlbum
    end

    it 'expect on spotify to be correct' do
        expect(@music.on_spotify).to be(true)
    end
  
    #it 'expect publish date to be correct' do
     # expect(@music.publish_date).to be_a(Date)
    #end
   
  end