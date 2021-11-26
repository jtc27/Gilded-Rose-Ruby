class BackstagePassesUpdater
  attr_reader :item

  def initialize(item)
    @item = item
  end

  def update
    if item.quality < 50
      item.quality = item.quality + 1 #Quality increases by 1 when there are more than 11 days left
      if item.sell_in < 11
        if item.quality < 50
          item.quality = item.quality + 1 #Quality increases by 2 when there are 10 to 6 days left
        end
      end
      if item.sell_in < 6
        if item.quality < 50
          item.quality = item.quality + 1 #Quality increases by 3 when there are 5 to 1 days left
        end
      end
    end
    item.sell_in = item.sell_in - 1
    if item.sell_in < 0  #Quality drops to 0 after the concert
      item.quality = item.quality - item.quality
    end
  end
end