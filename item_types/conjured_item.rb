class ConjuredItem < Item
    attr_accessor :quality, :sell_in, :name

    def initialize(name, sell_in, quality)
        super
    end

    def update_quality
        unless @quality < 2
            @quality -= 2
        else
            @quality = 0
        end
        @sell_in -= 1
    end

end
