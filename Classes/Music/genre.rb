class Genre
    @@genres = []
    attr_reader :name, :items
  
    def initialize(gen_name)
      @id = rand(1...1000)
      @gen_name = gen_name
      @items = []
  
      @@genres << self
    end
  
    def self.all_genres
      @@genres
    end
  
    def add_item(item)
      @items.push(item)
      item.genre = self
    end
  end