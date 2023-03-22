def path_finder(all_games_arr, all_authors_arr)
if all_games_arr && all_authors_arr.not_empty?
    files = [{'game_data.json'=>all_games_arr}, {'author_data.json'=>all_authors_arr}]
    files.each do |file|
        mykeys = file.keys
        mykeys
    end
end
end