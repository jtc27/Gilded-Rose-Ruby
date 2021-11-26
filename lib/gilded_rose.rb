require_relative 'sulfuras'
require_relative 'backstage_passes'
require_relative 'aged_brie'
require_relative 'conjured_item'
require_relative 'basic_item'

class GildedRose
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      update(item)
    end
  end

  private

  def update(item)
    if item.name == "Sulfuras, Hand of Ragnaros"
      SulfurasUpdater.new(item).update
    elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
      BackstagePassesUpdater.new(item).update
    elsif item.name == "Aged Brie"
      AgedBrieUpdater.new(item).update
    elsif item.name == "Conjured Item"
      ConjuredItemUpdater.new(item).update
    else
      BasicItemUpdater.new(item).update
    end
  end


end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end

end
