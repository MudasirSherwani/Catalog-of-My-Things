require 'json'
require 'pry'
require_relative 'genre'
require_relative 'music_album'
require_relative '../Game/get_user_data.rb'

class Music
  attr_accessor :list_genres, :list_albums

  def initialize
    @music_file = 'Classes/Music/music_data.json'
    @genre_json = []
    @music_json = load_json
  end

  def add_musicalbum
    puts 'Release Date [yyyy-MM-dd] :'
    rel_date = gets.chomp
    rel_date = check_date(rel_date)
    puts 'Can be archived? [Y/N]'
    archived = gets.chomp.upcase
    puts 'On spotify? [Y/N]'
    spotify = gets.chomp.upcase
    music_album = MusicAlbum.new(rel_date, archived, spotify)
    genre_recieved = add_genre
    genre_recieved.add_item(music_album)
    puts 'Music Album created succesfully'
    @music_json << { Genre_Id: music_album.genre.id, Genre_Name: music_album.genre.gen_name,
                     Release_date: music_album.publish_date, Archived: music_album.archived,
                     Spotify: music_album.on_spotify, music_id: music_album.music_id }
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
    File.open(@music_file, 'w') do |f|
      f.puts JSON.generate(@music_json)
    end
  end

  def load_json
    File.exist?(@music_file)
    JSON.parse(File.read(@music_file))
  end

  def list_music
    load_json.each do |item|
      print "\nMusic_id: #{item['music_id']} On_Spotify: #{item['Spotify']} "
      print "Archived: #{item['Archived']} Release_date: #{item['Release_date']}"
    end
  end

  def list_genre
    load_json.each do |item|
      print "\nGenre_Id: #{item['Genre_Id']} Genre_Name: #{item['Genre_Name']}"
    end
    puts "\n"
  end
end
