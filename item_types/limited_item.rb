class LimitedItem < Item
    attr_accessor :quality, :sell_in, :name

    def initialize(name, sell_in, quality)
        super
    end

    def update_quality
        if (@sell_in > 10)
            @quality += 1
        elsif (@sell_in <= 10 && @sell_in > 5)
            @quality += 2
        elsif (@sell_in <= 5 && @sell_in > 0)
            @quality += 3
        else
            @quality = 0
        end
        @sell_in -= 1
    end

end
