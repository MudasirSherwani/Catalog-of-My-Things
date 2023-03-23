require_relative '../Classes/Music/music_album'

describe MusicAlbum do
  before(:each) do
    @music = MusicAlbum.new('2023/03/23', true, true)
  end

  context 'Test MusicAlbum with methods' do
    it 'Expecting new instance' do
      expect(@music).to be_instance_of(MusicAlbum)
    end
  end

  it 'Expecting can_be_archive? method' do
    expect(@music.can_be_archived?).to be(true)
  end
end
