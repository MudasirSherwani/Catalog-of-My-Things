require 'date'

class Item
  attr_reader :archived
  attr_accessor :genre, :author, :source, :label, :publish_date

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = DateTime.parse(publish_date)
    @archived = false
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_author(author)
    @author = author
  end

  def add_source(source)
    @source = source
  end

  def add_label(label)
    @label = label
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def can_be_archived?
    current_year = DateTime.now.year
    publish_year = @publish_date.year
    @archived = publish_year <= current_year - 10
    @archived
  end
end


# item1 = Item.new('2009-06-01') item1.can_be_archived? item1.move_to_archive
# item2 = Item.new('2016-06-01') item2.can_be_archived? item2.move_to_archive
