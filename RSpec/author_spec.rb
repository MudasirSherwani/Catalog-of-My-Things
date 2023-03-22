require_relative '../Classes/item'
require_relative '../Classes/Game/author'
describe Author do
  context 'With valid parameter, #add_item' do
    it 'should add the item to the items array' do
      author = Author.new('john', 'coughman')
      item = Item.new('2022-03-14')
      author.add_item(item)
      items_array = author.items

      expect(items_array.size).to eq(1)
    end
  end

  context 'With valid parameter, #add_item' do
    it 'should set the item @author property to self' do
      author = Author.new('john', 'coughman')
      item = Item.new('2022-03-14')
      author.add_item(item)
      attribute = item.author

      expect(attribute).to eq(author)
    end
  end
end
