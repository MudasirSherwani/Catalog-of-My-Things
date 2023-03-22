require './label'
require './item'
require './book'

# unit tests for label class
describe Label do
  let(:label) { Label.new('title', 'color') }
  let(:item) { Item.new('2009-06-01') }
  let(:book) { Book.new('publisher', 'good', '2009-06-01') }

  context '# add_item method' do
    it 'should add item to items array' do
      label.add_item(item)
      expect(label.items).to include(item)
    end

    it 'should add book to items array' do
      label.add_item(book)
      expect(label.items).to include(book)
    end
  end
end