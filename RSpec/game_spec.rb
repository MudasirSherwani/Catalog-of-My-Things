require_relative '../Classes/Game/game'

describe Game do
  context '#can_be_archive when called' do
    it 'should return false if @last_played_at > 2' do
      game = Game.new('2010-03-10', 'yes', '2022-03-21')
      result = game.can_be_archived?

      expect(result).to eq(false)
    end
  end
end
