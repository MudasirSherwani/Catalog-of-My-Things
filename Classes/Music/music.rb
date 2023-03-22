require 'json'

require_relative 'genre'
require_relative 'music_album'

class Music
  attr_accessor :list_genres, :list_albums

  def initialize
    @genre_json = []
    @music_json = []
    @music_file = 'Classes/Music/music_data.json'
    load_json
  end

  def add_musicalbum
    puts 'Release Date [yyyy/MM/dd] :'
    rel_date = gets.chomp
    puts 'Can be archived? [Y/N]'
    archived = gets.chomp.upcase
    puts 'On spotify? [Y/N]'
    spotify = gets.chomp.upcase
    music_album = MusicAlbum.new(rel_date, archived, spotify)
    genre_recieved = add_genre
    genre_recieved.add_item(music_album)
    puts 'Music Album created succesfully'
    @music_json << music_album
    save_json
  end

  def add_genre
    puts 'Genre Name:'
    genre_name = gets.chomp
    genre = Genre.new(genre_name)
    @genre_json << genre
    genre
  end

  def save_json
    music_list_arr = []
    @music_json.each do |music|
      music_list_arr.push({ Genre_Id: music.genre.id, Genre_Name: music.genre.gen_name,
                            Release_date: music.publish_date, Archived: music.archived,
                            Spotify: music.on_spotify, music_id: music.music_id })
    end
    File.exist?(@music_file)
    File.write(@music_file, JSON.pretty_generate(music_list_arr))
  end

  
end
