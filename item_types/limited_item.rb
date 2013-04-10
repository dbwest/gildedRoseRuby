class LimitedItem < Item
    attr_accessor :quality, :sell_in, :name

    def initialize(name, sell_in, quality)
        super
    end

    def update_quality
        unless sell_in <= 0
            @quality += 1
        else
            @quality = 0
        end
        @sell_in -= 1
    end

end
