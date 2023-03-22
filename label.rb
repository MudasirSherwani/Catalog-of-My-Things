class Label
  attr_reader :id, :title, :color, :items
  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def to_json(*args)
    {
      id: @id,
      title: @title,
      color: @color,
      items: @items
    }.to_json(*args)
  end

end
