require './item.rb'
require './regular_item.rb'
require './vintage_item.rb'
require './legendary_item.rb'
require './limited_item.rb'
require './conjured_item.rb'

class GildedRose

    attr_accessor :items

  @items = []

  def initialize
    @items = []
    @items << RegularItem.new("+5 Dexterity Vest", 10, 20)
    @items << VintageItem.new("Aged Brie", 2, 0)
    @items << RegularItem.new("Elixir of the Mongoose", 5, 7)
    @items << LegendaryItem.new("Sulfuras, Hand of Ragnaros", 0, 80)
    @items << LimitedItem.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)
    @items << ConjuredItem.new("Conjured Mana Cake", 3, 6)
  end

  def update_quality

    @items.each do |i|
        i.update_quality
    end

  end


end
