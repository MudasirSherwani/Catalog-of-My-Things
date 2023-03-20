class Main
  def show_list
    puts 'Please choose an option by entering a number'
    action_list = {
      '1': 'List all books',
      '2': 'List all music albums',
      '3': 'List of games',
      '4': 'List all genres',
      '5': 'List all labels',
      '6': 'List all authors',
      '7': 'Add a book',
      '8': 'Add a music album',
      '9': 'Add a game',
      '10': 'Exit'
    }

    action_list.each do |index, action|
      puts "#{index} - #{action}"
    end
  end