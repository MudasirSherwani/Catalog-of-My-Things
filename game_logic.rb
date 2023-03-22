require_relative './Classes/Game/game'
require_relative './Classes/Game/author'
require_relative './Classes/item'

# add game section here...
def add_game(games_arr, authors_arr)
  puts 'Enter game title :'
  game_label = gets.chomp

  puts 'Enter game genre :'
  game_genre = gets.chomp

  puts 'Enter author first name :'
  author_fname_res = gets.chomp

  puts 'Enter author last name :'
  author_lname_res = gets.chomp

  puts 'Does game support multiplayer ? [Yes/N0] :'
  multiplayer_res = gets.chomp

  puts 'Enter date game was published [yy-mm-dd] :'
  published_date_res = gets.chomp

  puts 'Enter the date you last Played [yy-mm-dd] :'
  last_played_res = gets.chomp

  author = Author.new(author_fname_res, author_lname_res)
  new_author = {
    'first_name' => author.first_name,
    'last_name' => author.last_name
  }
  authors_arr << new_author

  item(published_date_res, game_genre, game_label, author)

  new_game = Game.new(published_date_res, multiplayer_res, last_played_res)
  game = {
    'id' => new_game.id,
    'title' => game_label,
    'genre' => game_genre,
    'multi-player' => new_game.multiplayer,
    'published_date' => new_game.publish_date.strftime('%m/%d/%Y'),
    'last_played' => new_game.last_played_at
  }

  games_arr << game
  puts 'game successfully added!!'
  puts ' '
end

def item(published_date, game_genre, game_label, author_obj)
  new_item = Item.new(published_date)
  new_item.label = game_label

  new_item.genre = game_genre

  author_obj.add_item(new_item)
end

def all_games(all_games_arr)
  if all_games_arr.empty?
    puts 'No games available, sorry. Add a game!'
  else
    all_games_arr.each.with_index(1) do |game, index|
      puts "#{index}) Id: #{game['id']}
Genre: #{game['genre']}
Title: #{game['title']}
Multi-player: #{game['multi-player']}
Published-Date: #{game['published_date']}
Last-Played: #{game['last_played']}\n"
    end
  end
  puts ' '
end

def all_authors(all_authors_arr)
  if all_authors_arr.empty?
    puts 'No Authors available, sorry. Add a game!'
  else
    all_authors_arr.each.with_index(1) do |author, index|
      puts "#{index}) #{author['firstname']} #{author['last_name']}"
    end
  end
  puts ' '
end
