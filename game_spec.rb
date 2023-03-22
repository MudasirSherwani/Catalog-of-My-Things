require_relative './game'

describe Game do
  context '#can_be_archive when called' do
    it 'should return false if @last_played_at > 2' do
      game = Game.new('2015-03-10', 'yes', '2023-06-03')
      result = game.can_be_archive?

      expect(result).to eq(true)
    end
  end

  context '#can_be_archive when called' do
    it 'should return true if @last_played_at < 2' do
      game = Game.new('2010-03-10', 'yes', '2021-03-21')
      result = game.can_be_archive?
    
    puts "@last_played_at: #{game.last_played_at}"
      puts "result: #{result}"


      expect(result).to eq(false)
    end
  end
end
