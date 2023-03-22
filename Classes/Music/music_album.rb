require_relative '../item'

class MusicAlbum < Item
  attr_accessor :publish_date, :archive, :on_spotify, :music_id

  def initialize(release_date, archived, on_spotify)
    super(release_date)
    @music_id = Random.rand(1..1000)
    @on_spotify = on_spotify
    @archived = archived
  end

  def can_be_archived?
    if @archived && @on_spotify
      true
    else
      false
    end
  end
end
