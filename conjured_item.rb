class ConjuredItem < Item
    attr_accessor :quality, :sell_in, :name

    def initialize(name, sell_in, quality)
        super
    end

    def update_quality
        @quality -= 2
        @sell_in -= 1
    end

end
