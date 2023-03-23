require 'date'
require_relative '../item'
require_relative './game'
require_relative './author'

def gather_game_data
  puts 'Enter game title :'
  label = gets.chomp

  puts 'Enter game genre :'
  genre = gets.chomp

  puts 'Enter author first name :'
  firstname = gets.chomp

  puts 'Enter author last name :'
  lastname = gets.chomp

  puts 'Does game support multiplayer ? [Y/N] :'
  multi_player = gets.chomp
  multiplayer = check_res(multi_player)

  puts 'Enter date game was published [yy-mm-dd] :'
  published_date = gets.chomp
  published_date = check_date(published_date)

  puts 'Enter the date you last Played [yy-mm-dd] :'
  last_played = gets.chomp
  last_played = check_date(last_played)

  [label, genre, multiplayer, published_date, last_played, lastname, firstname]
end

def add_game(games_arr, authors_arr)
  label, genre, multiplayer, published_date, last_played, lastname, firstname = gather_game_data

  author = Author.new(firstname, lastname)
  new_author = {
    'first_name' => author.first_name,
    'last_name' => author.last_name
  }
  authors_arr << new_author

  item(published_date, genre, label, author)

  new_game = Game.new(published_date, multiplayer, last_played)
  game = {
    'id' => new_game.id,
    'title' => label,
    'genre' => genre,
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

def check_date(date)
  format = '%Y-%m-%d'
  DateTime.strptime(date, format)
  date
rescue ArgumentError
  puts 'Invalid date. Required format [YYYY-MM-DD]'
  print 'Try again: '
  date = gets.chomp
  check_date(date)
end

def check_res(res)
  case res.upcase
  when 'Y'
    'YES'
  when 'N'
    'NO'
  else
    puts 'Invalid Input. Required format [Y/N]'
    print 'Try again: '
    input = gets.chomp
    check_res(input)
  end
end
