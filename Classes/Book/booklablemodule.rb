# require_relative '../item'
require 'json'
require_relative './book'
require_relative './label'

module BookLabel
  def fetch_books
    # unless File.exist?('../../storage/books.json')
    File.open('./Classes/Book/books.json', 'w') unless File.exist?('./Classes/Book/books.json')
    book_data = File.read('./Classes/Book/books.json')

    if book_data.empty?
      []
    else
      File.open('./Classes/Book/books.json', 'r') { |line| JSON.parse(line.read) }
    end
  end

  def fetch_labels
    File.open('./Classes/Book/labels.json', 'w') unless File.exist?('./Classes/Book/labels.json')
    lable_data = File.read('./Classes/Book/labels.json')

    if lable_data.empty?
      []
    else
      File.open('./Classes/Book/labels.json', 'r') { |line| JSON.parse(line.read) }
    end
  end

  # add book
  def add_book
    print 'Publisher: '
    publisher = gets.chomp
    print 'Cover state[good or bad]: '
    cover_state = gets.chomp
    print 'Publication date (yyyy-mm-dd): '
    publish_date = gets.chomp
    book = Book.new(publisher, cover_state, publish_date)


    print 'Title of the lable: '
    title = gets.chomp.capitalize
    print 'Color: '
    color = gets.chomp

    label = Label.new(title, color)
    # label.add_item(book.to_json)
    book_item = book.to_json
    label.add_item(book_item)


    # add_label(book)
    store_book(book)
    store_label(label)

    puts 'label added successfully'
    puts 'Book created successfully'
  end

  # storage
  def store_book(book)
    books = fetch_books
    books << book.to_json
    File.write('./Classes/Book/books.json', JSON.generate(books), mode: 'w')
  end

  def store_label(label)
    labels = fetch_labels

    labels << label.to_json
    File.write('./Classes/Book/labels.json', JSON.generate(labels), mode: 'w')
  end

  # listings

  def list_all_books
    books = fetch_books
    return puts 'There are no books stored!' if books.empty?

    books.each do |book|
      puts "Publisher: #{book['publisher']}, Cover_state: #{book['cover_state']}, Publish_date: #{book['publish_date']}"
    end
  end

  def list_all_labels
    labels = fetch_labels
    return puts 'There are no labels stored!' if labels.empty?

    labels.each do |label|
      puts "Title: #{label['title']}, Color: #{label['color']}"
    end
  end
end
