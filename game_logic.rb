require_relative './game'
require_relative './author'
require_relative './item'

def add_game
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

  item(author_fname_res, author_lname_res, published_date_res, game_genre, game_label)

  Game.new(published_date_res, multiplayer_res, last_played_res)

  puts 'game successfully added!!'
end

def item(first_name, last_name, published_date, game_genre, game_label)
  author = Author.new(first_name, last_name)

  new_item = Item.new(published_date)
  new_item.label = game_label

  new_item.genre = game_genre
  puts new_item.label

  author.add_item(new_item)
end
