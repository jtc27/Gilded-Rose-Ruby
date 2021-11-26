class BasicItemUpdater
  attr_reader :item

  def initialize(item)
    @item = item
  end

  def update
    if item.quality > 0
      item.quality = item.quality - 1
    end
    item.sell_in = item.sell_in - 1
    if item.sell_in < 0  
      if item.quality > 0  # The Quality of an item is never negative
        item.quality = item.quality - 1 # Sell by date has passed, Quality degrades twice as fast
      end
    end
  end

end