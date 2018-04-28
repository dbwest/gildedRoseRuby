class RegularItem < Item
    attr_accessor :quality, :sell_in, :name

    def initialize (name, sell_in, quality)
        super
    end

    def update_quality

        unless @quality == 0
            if sell_in <= 0
                @quality -= 2
            else
                @quality -= 1
            end
        end

        if @quality < 0
            @quality = 0
        end
        @sell_in -= 1
    end

end
