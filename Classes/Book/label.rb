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
  end

  def to_json(*_args)
    {
      title: @title,
      color: @color,
      items: @items
    }
  end
end
