class Item2 < Item

  attr_accessor :type

  def initialize (name, sell_in, quality, type)
      super(name, sell_in, quality)
      @type = type
  end

end
