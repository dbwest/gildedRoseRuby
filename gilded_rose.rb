require './item.rb'
require './item2.rb'

class GildedRose

    attr_accessor :items

  @items = []

  def initialize
    @items = []
    @items << Item2.new("+5 Dexterity Vest", 10, 20, "Regular Item")
    @items << Item2.new("Aged Brie", 2, 0, "Vintage Item")
    @items << Item2.new("Elixir of the Mongoose", 5, 7, "Regular Item")
    @items << Item2.new("Sulfuras, Hand of Ragnaros", 0, 80, "Legendary Item")
    @items << Item2.new("Backstage passes to a TAFKAL80ETC concert", 15, 20, "Event Ticket Item")
    @items << Item2.new("Conjured Mana Cake", 3, 6, "Conjured Item")
  end

  def update_quality

    for i in 0..(@items.size-1)
      if (@items[i].name != "Aged Brie" && @items[i].name != "Backstage passes to a TAFKAL80ETC concert")
        if (@items[i].quality > 0)
          if (@items[i].name != "Sulfuras, Hand of Ragnaros")
            @items[i].quality = @items[i].quality - 1
          end
        end
      else
        if (@items[i].quality < 50)
          @items[i].quality = @items[i].quality + 1
          if (@items[i].name == "Backstage passes to a TAFKAL80ETC concert")
            if (@items[i].sell_in < 11)
              if (@items[i].quality < 50)
                @items[i].quality = @items[i].quality + 1
              end
            end
            if (@items[i].sell_in < 6)
              if (@items[i].quality < 50)
                @items[i].quality = @items[i].quality + 1
              end
            end
          end
        end
      end
      if (@items[i].name != "Sulfuras, Hand of Ragnaros")
        @items[i].sell_in = @items[i].sell_in - 1;
      end
      if (@items[i].sell_in < 0)
        if (@items[i].name != "Aged Brie")
          if (@items[i].name != "Backstage passes to a TAFKAL80ETC concert")
            if (@items[i].quality > 0)
              if (@items[i].name != "Sulfuras, Hand of Ragnaros")
                @items[i].quality = @items[i].quality - 1
              end
            end
          else
            @items[i].quality = @items[i].quality - @items[i].quality
          end
        else
          if (@items[i].quality < 50)
            @items[i].quality = @items[i].quality + 1
          end
        end
      end
    end
  end

end
