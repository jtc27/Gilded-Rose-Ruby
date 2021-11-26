class ConjuredItemUpdater
  attr_reader :item

  def initialize(item)
    @item = item
  end

  def update
    if item.quality > 0
      item.quality = item.quality - 2
    end
    item.sell_in = item.sell_in - 1
    if item.sell_in < 0 # Once the sell by date has passed, Quality degrades twice as fast
      if item.quality > 0
        item.quality = item.quality - 2
      end
    end
  end
end