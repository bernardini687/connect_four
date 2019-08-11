module ConnectFour
  class Player
    attr_reader :color
    def initialize(color:)
      @color = color
    end

    def color_name
      case color
      when '■' then 'black'
      else 'white'
      end
    end
  end
end
