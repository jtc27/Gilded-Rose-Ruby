require 'gilded_rose'
require 'test/unit'
require_relative 'spec_helper'

#Item.new parameters (name, sell_in, quality)

RSpec.describe GildedRose do

  describe "#Sulfuras" do
    it 'does not change at all' do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 100, 100)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 100
      expect(items[0].quality).to eq 100
    end

  end

  describe "#Backstage_Passes" do
    it 'has -1 sell_in and +1 quality: 11 or more days until the concert.' do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 7)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 14
      expect(items[0].quality).to eq 8
    end

    it 'has -1 sell_in and +2 quality: 10 Days left until the concert!' do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 44)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 9
      expect(items[0].quality).to eq 46
    end

    it 'has -1 sell_in and +2 quality: 6 Days left until the concert!' do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 6, 44)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 5
      expect(items[0].quality).to eq 46
    end

    it 'has -1 sell_in and +3 quality: 5 Days left until the concert!' do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 44)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 4
      expect(items[0].quality).to eq 47
    end


    it 'has -1 sell_in and +3 quality: 1 Day left until the concert!' do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 1, 44)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 0
      expect(items[0].quality).to eq 47
    end

    it 'has 0 quality value after the concert is over' do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 44)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq -1
      expect(items[0].quality).to eq 0
    end


    it 'never has quality value above 50' do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 14
      expect(items[0].quality).to eq 50
    end
  end


  describe "#Aged_Brie" do
    it 'has -1 sell_in and +1 quality' do
      items = [Item.new("Aged Brie", 7, 7)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 6 
      expect(items[0].quality).to eq 8
    end


    it 'never has quality value above 50' do
      items = [Item.new("Aged Brie", 8, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 7 
      expect(items[0].quality).to eq 50
    end
  end


  describe "#basic_item" do
    it 'has -1 sell_in and -1 quality' do
      items = [Item.new("item", 7, 7)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 6 
      expect(items[0].quality).to eq 6
    end

    it 'has -1 sell_in and -2 quality: sell by date has passed, quality degrades double' do
      items = [Item.new("item", -1, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq -2 
      expect(items[0].quality).to eq 8
    end

    it 'never has negative quality value' do
      items = [Item.new("item", 8, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 7 
      expect(items[0].quality).to eq 0
    end

  end

  describe "#conjured_item" do
    it 'has -1 sell_in and -2 quality' do
      items = [Item.new("Conjured Item", 7, 7)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 6 
      expect(items[0].quality).to eq 5
    end

    it 'has -1 sell_in and -4 quality: sell by date has passed, quality degrades double' do
      items = [Item.new("Conjured Item", -1, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq -2 
      expect(items[0].quality).to eq 6
    end

    it 'never has negative quality value' do
      items = [Item.new("Conjured Item", 8, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 7 
      expect(items[0].quality).to eq 0
    end

  end

  # Approvals ensure the test code behavior doesn't change, as we refactor GildedRose
  # https://github.com/kytrinyx/approvals
  # creates spec > fixtures .... text file.  2 text files: 'received' and 'approved'.  If they match, the test passes

  # Approvals / checks that refactoring legacy code does not produce undesirable behavior
  describe "#Approvals" do
    it 'is characterized' do  
      verify do
        names = [
          'Aged Brie',
          "Backstage passes to a TAFKAL80ETC concert",
          "Sulfuras, Hand of Ragnaros",
          'Any Other Item'
        ]
        sell_ins = [-1, 0, 1, 5, 6, 7, 10, 11, 12] # cross products for every type of case
        qualities = [-1, 0, 1, 49, 50, 51]         # for max coverage

        items = names.product(sell_ins, qualities).map { |(name, sell_in, quality)|
          Item.new(name, sell_in, quality)
        }
        gilded_rose = GildedRose.new(items)

        gilded_rose.update_quality

        gilded_rose.items.map(&:to_s)
      end
    end
  end


end