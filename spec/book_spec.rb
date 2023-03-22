require './book'
require './item'

# unit test for book class can_be_archived method
describe Book do
  let(:book) { Book.new('publisher', 'good', '2009-06-01') }
  let(:book2) { Book.new('publisher', 'bad', '2009-06-01') }
  let(:book3) { Book.new('publisher', 'good', '2019-06-01') }
  let(:book4) { Book.new('publisher', 'bad', '2019-06-01') }

  context '# can_be_archived method' do
    it 'should return true if book is older than 10 years and cover state is good' do
      expect(book.can_be_archived?).to be true
    end

    it 'should return true if book is older than 10 years and cover state is bad' do
      expect(book2.can_be_archived?).to be true
    end

    it 'should return false if book is not older than 10 years and cover state is good' do
      expect(book3.can_be_archived?).to be false
    end

    it 'should return true if book is not older than 10 years and cover state is bad' do
      expect(book4.can_be_archived?).to be true
    end
  end
end





