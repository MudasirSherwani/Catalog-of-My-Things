class Item
  attr_reader :archived
  attr_accessor :genre, :author, :source, :label, :publish_date

  def initialize(genre, author, source, label, publish_date)
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def move_to_archive; end

  private

  def can_be_archive?; end
end
