class LegendaryItem < Item
    attr_accessor :quality, :sell_in, :name

    def initialize(name, sell_in, quality)
        super
    end

    def update_quality
    end

end
