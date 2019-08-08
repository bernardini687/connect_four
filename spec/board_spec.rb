# get cell
# set cell
# assess the grid

# FOUR_IN_A_ROW

module ConnectFour
  RSpec.describe Board do

    context '#initialize' do
      it 'is successfully initialized without arguments' do
        expect(Board.new).not_to raise_error ArgumentError
      end

      it 'sets the grid with 6 rows by default' do
        board = Board.new

        expect(board.grid).to have(6).things
      end

      it 'creates 7 things in each row by default' do
        board = Board.new

        board.grid.each do |row|
          expect(row).to have(7).things
        end
      end

      it 'is successfully initialized with a custom grid' do
        expect(Board.new grid: :foo).not_to raise_error ArgumentError
      end

      describe '#grid' do
        it 'returns the grid' do
          board = Board.new grid: :foo

          expect(board.grid).to eq :foo
        end
      end
    end
  end
end
