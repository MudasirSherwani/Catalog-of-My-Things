require 'json'

def load_game_data(all_games_arr, all_authors_arr)
  files = [{ './Classes/Game/game_data.json' => all_games_arr },
           { './Classes/Game/author_data.json' => all_authors_arr }]

  files.each do |file|
    file_path = file.keys.first
    data_arr = file.values.first
    load_file_data(file_path, data_arr) if File.exist?(file_path)
  end
end

def load_file_data(file_name, init_arr)
  # Read the existing JSON data from the file and parse it into a Ruby array
  json_data = File.read(file_name)
  old_data = JSON.parse(json_data)

  init_arr.replace(old_data) # Replace the contents of the array with the loaded data
end
