require 'date'

class Item
  attr_reader :archived
  attr_accessor :genre, :author, :source, :label, :publish_date

  def initialize(genre, author, source, label, publish_date)
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = DateTime.parse(publish_date)
    @archived = false
  end

  def move_to_archive
    @archived = true if can_be_archive?
  end

  # private

  def can_be_archive?
    current_year = DateTime.now.year
    publish_year = @publish_date.year
    if publish_year <= current_year - 10
      @archived = true
    else
      @archived = false
    end
    return @archived
  end
end

# item1 = Item.new('action','me','sd','label', '2009-06-01') item1.can_be_archive?
