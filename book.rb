require_relative './item'
require 'json'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, publish_date)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def to_json(*args)
    {
      publisher: @publisher,
      cover_state: @cover_state,
    }.to_json(*args)
  end
end

# Item.new('action','me','sd','label', '2009-06-01')
# book1 = Book.new('publisher','good','2009-06-01')

#let(:book) { Book.new('washindi', 'good', '2009-06-01') }