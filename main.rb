class Main
  def director(user_answer)
    case user_answer
    when 1
      # all_books
    when 2
      # all_people
    when 3
      # make_person
    when 4
      # create_book
    when 5
      # create_rental
    when 6
      # user_rentals
    end
  end

  def show_list
    puts 'Welcome to School Library App!'
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

      if user_answer == 10
        puts 'thank you for using this app'
        break
      end
      director(user_answer)
    end
  end
end

main = Main.new
main.show_list
