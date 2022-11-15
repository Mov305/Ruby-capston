class MusicAlbum

    attr_accessor :on_spotify, :title

    def initialize(on_spotify, title, archived: false)
        @on_spotify = on_spotify
        @title = title
      end
    
      def can_be_archived?
         @on_spotify == 'Yes'
      end


end