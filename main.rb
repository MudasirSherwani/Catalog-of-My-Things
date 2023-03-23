require_relative './Classes/Game/game_logic'
require_relative './Classes/Game/path_finder'
require_relative './Classes/Game/load_game_data'
require_relative './Classes/Game/get_user_data'
require_relative 'Classes/Music/music'
require_relative './Classes/Book/booklablemodule'

class Main
  include BookLabel
  def initialize()
    @all_games = []
    @all_authors = []
  end

  def director(user_answer)
    music = Music.new
    case user_answer
    when 1
      list_all_books
    when 2
      # '2 List all music albums'
      music.list_music
    when 3
      all_games(@all_games)
    when 4
      # '4 List all genres'
      music.list_genre
    when 5
      list_all_labels
    when 6
      all_authors(@all_authors)
    else
      director_add_items(user_answer)
    end
  end

  def director_add_items(user_answer)
    music = Music.new
    case user_answer
    when 7
      add_book
    when 8
      # '8 Add a music album'
      music.add_musicalbum
    when 9
      puts 'Follow the prompts to add a game'
      add_game(@all_games, @all_authors)
    when 10
      puts 'Thank you for using this app'
      path_finder(@all_games, @all_authors)

      exit
    else
      puts 'Invalid Input Try Again !'
    end
  end

  def show_list
    puts ''
    puts 'Welcome to Catalog of My Things App!'
    load_game_data(@all_games, @all_authors)
    loop do
      puts '1 List all books'
      puts '2 List all music albums'
      puts '3 List of games'
      puts '4 List all genres'
      puts '5 List all labels'
      puts '6 List all authors'
      puts '7 Add a book'
      puts '8 Add a music album'
      puts '9 Add a game'
      puts '10 Exit'
      user_answer = gets.chomp.to_i
      director(user_answer)
    end
  end
end

main = Main.new
main.show_list
