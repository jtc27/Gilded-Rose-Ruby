## Gilded Rose Ruby
🌹  Classic Kata

[Read the requirements here](https://github.com/makersacademy/course/blob/main/individual_challenges/gilded_rose.md)

<a href=https://github.com/makersacademy/course/blob/main/individual_challenges/gilded_rose.md>
<img src="https://amour-rose-eternelle.fr/wp-content/uploads/2020/12/rose-dore.jpg" width="250"/></a>

## Installation
Clone the repository
``` bash
% git clone https://github.com/jtc27/Gilded-Rose-Ruby.git
% bundle install
```

## Approvals
The gem [approvals](https://github.com/kytrinyx/approvals) was used in testing.  As I was refactoring legacy code, the approvals ensured there was no undesirable behavior from the code.  This is called a [characterization test](https://en.wikipedia.org/wiki/Characterization_test), or Golden Master Testing.

Here is an excerpt from the approval test in gilded_rose_spec.rb

``` bash
it 'is characterized' do  
 verify do
 names = [
          'Aged Brie',
          "Backstage passes to a TAFKAL80ETC concert",
          "Sulfuras, Hand of Ragnaros",
          "Conjured Item",
          'Any Other Item'
        ]
        sell_ins = [-1, 0, 1, 5, 6, 7, 10, 11, 12] 
        qualities = [-1, 0, 1, 49, 50, 51]         

        items = names.product(sell_ins, qualities).map { |(name, sell_in, quality)|
          Item.new(name, sell_in, quality)
        }
        ...
   end
end
 ```
The items variable uses a .product method to combine every type of **name** with every **sell_in** and **quality**.  The approvals gem creates a text file in spec > fixtures >... `is_characterized.received.txt`.

This file can be renamed `is_characterized.approved.txt`.  Each time you run rspec, `is_characterized.approved.txt` is checked for any differences.  The test passes if there are no differences.  If there are, the test fails and you will have two text documents: `is_characterized.approved.txt` and `is_characterized.received.txt`.

`is_characterized.approved.txt` lists all combinations in the .product method and the rspec test has 100% coverage:

``` bash
idx|| name || sell_in || quality
[0] "Aged Brie, -2, 1"
[1] "Aged Brie, -2, 2"
[2] "Aged Brie, -2, 3"
[3] "Aged Brie, -2, 50"
[4] "Aged Brie, -2, 50"
[5] "Aged Brie, -2, 51"
...
...
[267] "Any Other Item, 11, 48"
[268] "Any Other Item, 11, 49"
[269] "Any Other Item, 11, 50"
```

## Process
The maze-like nested if statements were sifted through and cleaned up for each of the 4 item categories: Aged Brie, backstage passes, Sulfuras, and basic items.  Each class was given an .update method that would modify the item's sell_in and quality.  Lastly the conjured item class was added.

## What I learned
I learned about characterization tests and also practiced refactoring legacy code.  More of these exercises would be helpful to my development.


### Testing

|             | Tool                                                 | Description                         |
| :---------: | ---------------------------------------------------- | ----------------------------------- | 
| <img src="https://rspec.info/images/logo_ogp.png" height="auto" width="60">  | [RSpec](https://rspec.info/)                         | Testing tool for Ruby.              

### Gems

|       | Gem                                                                | Use?                                                                   |
| :---: | ------------------------------------------------------------------ | ---------------------------------------------------------------------- |
| :gem: | [approvals](https://github.com/kytrinyx/approvals) | You take a snapshot of an object, and then compare all future versions of the object to the snapshot.                                  |
| :gem: | [awesome_print](https://github.com/awesome-print/awesome_print)    | One of our favourite gems; pretty prints output from the Rails console. |
| :gem: | [bcrypt](https://github.com/bcrypt-ruby/bcrypt-ruby)    | Ruby password hashing to secure user passwords. |
| :gem: | [carrierwave](https://github.com/carrierwaveuploader/carrierwave)    | File upload solution for Rails in tandem with AWS S3. |
