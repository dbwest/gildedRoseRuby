class VintageItem < Item
    attr_accessor :quality, :sell_in, :name

    def initialize(name, sell_in, quality)
        super
    end

    def update_quality
        if quality < 50
            @quality += 1
        end
        @sell_in -= 1
    end

end
