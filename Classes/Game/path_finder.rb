require_relative './save_game'

def path_finder(all_games_arr, all_authors_arr)
  return unless all_games_arr.empty? == false && all_authors_arr.empty? == false

  files = [{ './Classes/Game/game_data.json' => all_games_arr },
           { './Classes/Game/author_data.json' => all_authors_arr }]
  files.each do |file|
    file_path = file.keys.first
    data_arr = file.values.first

    auto_save(file_path, data_arr)
  end
end
