class Genre
  attr_accessor :gen_name, :id, :items

  def initialize(gen_name)
    @gen_name = gen_name
    @id = Random.rand(1..1000)
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
