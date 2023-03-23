def all_games(all_games_arr)
  if all_games_arr.empty?
    puts 'No games available, sorry. Add a game!'
  else

    all_games_arr.each.with_index(1) do |game, index|
      puts ' '
      puts "#{index}) Id: #{game['id']}
Genre: #{game['genre']}
Title: #{game['title']}
Multi-player: #{game['multi-player']}
Published-Date: #{game['published_date']}
Last-Played: #{game['last_played']}\n"
      puts ' '
    end
  end
end

def all_authors(all_authors_arr)
  if all_authors_arr.empty?
    puts 'No Authors available, sorry. Add a game!'
  else
    all_authors_arr.each.with_index(1) do |author, index|
      puts ' '
      puts "#{index}) #{author['first_name']} #{author['last_name']}"
    end
    puts ' '
  end
end
