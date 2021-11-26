## Gilded Rose Ruby
🌹  Classic Kata

[Read the requirements here](https://github.com/makersacademy/course/blob/main/individual_challenges/gilded_rose.md)


## Installation
Clone the repository
``` bash
% git clone https://github.com/jtc27/Gilded-Rose-Ruby.git
% bundle install
```

## Approvals
The gem [approvals](https://github.com/kytrinyx/approvals) was used in testing.  As I was refactoring legacy code, the approvals ensured there was no undesirable behavior from the bode.  This is called a [characterization test](https://en.wikipedia.org/wiki/Characterization_test), or Golden Master Testing.

Here is an excerpt from the Approval test

``` bash
 names = [
          'Aged Brie',
          "Backstage passes to a TAFKAL80ETC concert",
          "Sulfuras, Hand of Ragnaros",
          "Conjured Item",
          'Any Other Item'
        ]
        sell_ins = [-1, 0, 1, 5, 6, 7, 10, 11, 12] # cross products for every type of case
        qualities = [-1, 0, 1, 49, 50, 51]         # for max coverage

        items = names.product(sell_ins, qualities).map { |(name, sell_in, quality)|
          Item.new(name, sell_in, quality)
        }
 ```
