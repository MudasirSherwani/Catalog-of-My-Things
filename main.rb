require './app'
class Main
  

  def nainfuc
    puts 'Welcome To your catolog of things!'
    app = App.new
    loop 
      show_list
      director(app)
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
      director(app)
    end
  end

  def director(app)
    user_answer = gets.chomp.to_i
    case user_answer
    when 1
      app.list_all_books
    when 2
      # all_people
    when 3
      # make_person
    when 4
      # create_book
    when 5
      # create_rental
    when 6
      # '6 List all authors'
    else
      director_add_items(user_answer)
    end
  end

  def director_add_items(user_answer)
    case user_answer
    when 7
      # '7 Add a book'
    when 8
      # '8 Add a music album'
    when 9
      # '9 Add a game'
    when 10
      puts 'Thank you for using this app'
      exit
    else
      puts 'Invalid Input Try Again !'
    end
  end

main = Main.new
main.nainfuc
