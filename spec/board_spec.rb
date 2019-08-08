# get cell
# set cell
# assess the grid

# FOUR_IN_A_ROW

# game_over if winner
#
# winner nil or Player
#
# def winner; return current_player if connected_four?
#
# def connected_four?; each_cons(4).any?

module ConnectFour
  RSpec.describe Board do

    context '#initialize' do
      it 'is successfully initialized without arguments' do
        expect { Board.new }.not_to raise_error
      end

      it 'sets the grid with 6 rows by default' do
        board = Board.new

        expect(board.grid.size).to eq 6
      end

      it 'creates 7 things in each row by default' do
        board = Board.new

        board.grid.each do |row|
          expect(row.size).to eq 7
        end
      end

      it 'is successfully initialized with a custom grid' do
        expect { Board.new grid: :foo }.not_to raise_error
      end

      describe '#grid' do
        it 'returns the grid' do
          board = Board.new grid: :foo

          expect(board.grid).to eq :foo
        end
      end
    end

    describe '#connected_four?' do
      it 'returns true when 4 of the same are sequential' do
        board = Board.new grid: %i[:foo :bar :foo :foo :foo :foo]

        expect(board.connected_four?(board.grid)).to be_truthy
      end
    end
  end
end
