class Bottle

  attr_reader :number, :item

  def initialize(number)
    @number = number
    @item = self.class.name.downcase
  end

  def count
    return combine('no more', items) if number == 0
    return combine(number, item)     if number == 1

    combine(number, items)
  end

  def subtract(value)
    return combine(Song::NUMBER_OF_BOTTLES, items) if number == 0
    return combine('no more', items)               if number == 1
    return combine(number + value, item)           if number == 2

    combine(number + value, items)
  end

  private

  def items
    item + 's'
  end

  def combine(number, word)
    [ number, word ].join(' ')
  end

end

class Song

  NUMBER_OF_BOTTLES = 99

  SUGGESTIONS =
    {
      share: 'Take one down and pass it around',
      errand: 'Go to the store and buy some more'
    }

  def self.lyrics
    NUMBER_OF_BOTTLES.downto(0).map do |num|	  
      stanza Bottle.new(num)
    end.join
  end

  private

  def self.stanza(bottle)
    "#{bottle.count.capitalize} of beer on the wall, #{bottle.count} of beer.\n" +
    "#{suggestion(bottle)}, #{bottle.subtract(-1)} of beer on the wall.\n\n"
  end

  def self.suggestion(bottle)
    bottle.number == 0 ? SUGGESTIONS[:errand] : SUGGESTIONS[:share]
  end

end

