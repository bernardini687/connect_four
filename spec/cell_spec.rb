module ConnectFour
  RSpec.describe Cell do

    context '#initialize' do
      describe '#value' do
        it 'defaults to " "' do
          cell = Cell.new

          expect(cell.value).to eq " "
        end
      end
    end

    describe '#empty?' do
      it 'is true when the value is " "' do
        expect(Cell.new.empty?).to be_truthy
      end

      it 'is false when the value is not " "' do
        filled_cell = Cell.new value: :foo

        expect(filled_cell.empty?).to be_falsey
      end
    end
  end
end
