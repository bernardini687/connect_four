module ConnectFour
  RSpec.describe Player do

    context '#initialize' do
      it 'raises an error when initialized without a color' do
        expect { Player.new }.to raise_error ArgumentError
      end

      describe '#color' do
        it 'returns the color of the player' do
          foo = Player.new color: :foo

          expect(foo.color).to eq :foo
        end
      end
    end
  end
end
