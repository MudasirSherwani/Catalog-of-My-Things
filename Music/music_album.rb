class MusicAlbum < Item
  attr_accessor :artist, :on_spotify, :genre
  
  def initialize(name, release_date, genre, artist, on_spotify)
    super(archived, release_date)
    @name = name
    @artist = artist
    @on_spotify = on_spotify
    @genre = genre
  end
  
  def can_be_archived?
    if @archived && @on_spotify
      true
    else
      false
    end
  end
  
  def self.list_music_albums
    puts 'listening music'
  end

end