module ConnectFour
  class Cell
    attr_accessor :value
    def initialize(value: " ")
      @value = value
    end

    def empty?
      value == " "
    end
  end
end
