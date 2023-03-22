require 'json'
require './book'
require './label'
class App
  def initialize

    base = Dir.pwd.to_s
    File.open("#{base}/storage/books.json", 'w') unless File.exist?("#{base}/storage/books.json")
    File.open("#{base}/storage/lable.json", 'w') unless File.exist?("#{base}/storage/lable.json")

    @books = []
    @labels = []

    book_data = File.read('./storage/books.json')
    label_data = File.read('./storage/lable.json')

    # @books = Writter.morph(book_data == '' ? [] : JSON.parse(book_data), 'books.json')
    # @labels = Writter.morph(label_data == '' ? [] : JSON.parse(label_data), 'lable.json')
  end

  def add_book(publisher, cover_state, publish_date)
    book = Book.new(publisher, cover_state, publish_date)
    @books << book
    # Writter.write(@books, 'books.json')
    book
  end

  def list_all_books
    if @books.empty?
      puts "please add a book\n\n"
    else
      @books.each do |book|
        puts "publisher: #{book.publisher}, cover_state: #{book.cover_state}, publish_date: #{book.publish_date}\n\n"
      end
    end
  end
end

