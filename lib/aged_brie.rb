class AgedBrieUpdater
  attr_reader :item

  def initialize(item)
    @item = item
  end

  def update
    if item.quality < 50
      item.quality = item.quality + 1
    end
    item.sell_in = item.sell_in - 1
    if item.sell_in < 0
      if item.quality < 50
        item.quality = item.quality + 1 #“Aged Brie” increases in Quality the older it gets
      end
    end
  end
end