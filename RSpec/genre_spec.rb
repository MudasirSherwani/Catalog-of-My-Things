require_relative '../Classes/Music/genre'

describe Genre do
    before(:each) do
      @genre = Genre.new('dance')
    end
  
    context 'Expected Genre Class with methods' do
      it 'Creating new instance of Genre' do
        expect(@genre).to be_instance_of(Genre)
      end
    end
  
    it 'Add New Item Method' do
      expect(@genre.items).to be_empty
    end
  end