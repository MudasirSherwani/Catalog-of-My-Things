module Booklablemodule
  def add_book
    puts "Enter the book's name: "
    name = gets.chomp
    puts "Enter the books's lable(e.g. 'Gift', 'New'): "
    lable = gets.chomp
    puts "Enter the book's author: "
    author_name = gets.chomp
    puts 'please enter the publisher'
    publisher = gets.chomp
    puts 'please enter the cover state(good or bad)'
    cover_state = gets.chomp
    puts 'please enter the publish date'
    publish_date = gets.chomp
    author = Author.new(author_name, nill)
    book = Book.new(publisher, cover_state)
    label = Label.new(lable, nill)
    item = Item.new(publish_date)
    @books << json.generate()
    puts "book added successfully\n\n"
  end