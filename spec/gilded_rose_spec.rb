require 'gilded_rose'
require 'test/unit'
require_relative 'spec_helper'

RSpec.describe GildedRose do

  it 'does not change the name' do
    ["foo"].product([0], [0]).each do |(name, sell_in, quality)|  #parameterized test for higher coverage

      # Parameterized test is to execute the same test over and over again using different values.
      #.product returns an array of all combinations of elements from all arrays.

      items = [Item.new(name, sell_in, quality)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end
  end


  it 'returns self' do
    items =[]
    gilded_rose = GildedRose.new
    
  end


  # Approvals ensure the test code behavior doesn't change, as we refactor GildedRose
  # https://github.com/kytrinyx/approvals
  # creates spec > fixtures .... text file.  2 text files: 'received' and 'approved'.  If they match, the test passes

  # Approvals
  it 'checks every combination of name, sell_in, quality' do  
    verify do
      names = [
        'Aged Brie',
        "Backstage passes to a TAFKAL80ETC concert",
        "Sulfuras, Hand of Ragnaros",
        'Any Other Item'
      ]
      sell_ins = [-1, 0, 1, 5, 6, 7, 10, 11, 12] # cross products for every type of case
      qualities = [-1, 0, 1, 49, 50, 51]         # meant for max coverage

      items = names.product(sell_ins, qualities).map { |(name, sell_in, quality)|
         Item.new(name, sell_in, quality)
      }
      gilded_rose = GildedRose.new(items)

      gilded_rose.update_quality

      gilded_rose.items.map(&:to_s)
    end
  end


end