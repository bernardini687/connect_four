# drop_piece -> set_cell(color, pos)
# assess the grid

# game_over if winner
#
# winner nil or Player
#
# def winner; return current_player if connected_four?

# lines.any? { |line| four_connected?(line) }

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

    describe '#lines' do # will be private
      it 'returns all the lines valid for winning' do
        board = Board.new

        expect(board.lines.size).to eq 25
      end
    end

    describe '#game_over?' do
      it 'detects the game is over' do
        board = Board.new
        1.upto(4) { |n| board.set_cell(:foo, n) }

        expect(board.game_over?).to be_truthy
      end
    end

    describe '#four_connected?' do
      it 'returns true when there is a sequence of 4 of the same' do
        board = Board.new grid: [" ", " ", :foo, :foo, :foo, :foo]

        expect(board.four_connected?(board.grid)).to be_truthy
      end

      it 'returns false when there is no sequence of 4 of the same' do
        board = Board.new grid: %i[foo bar foo foo foo bar]

        expect(board.four_connected?(board.grid)).to be_falsey
      end

      it 'ignores white space' do
        board = Board.new grid: [" ", " ", " ", " ", :foo, :bar]

        expect(board.four_connected?(board.grid)).to be_falsey
      end
    end
  end
end
