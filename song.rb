class Bottle

  attr_reader :number
  attr_accessor :item

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

  DETAILS = { item: 'beer', location: 'on the wall' }

  SUGGESTIONS =
    {
      share: 'Take one down and pass it around',
      errand: 'Go to the store and buy some more'
    }

  def self.lyrics
    (0..NUMBER_OF_BOTTLES).to_a.reverse.map do |num|
      stanza Bottle.new(num)
    end.join
  end

  private

  def self.stanza(bottle)
    "#{bottle.count.capitalize} of #{DETAILS[:item]} #{DETAILS[:location]}, #{bottle.count} of #{DETAILS[:item]}.\n" +
    "#{suggestion(bottle)}, #{bottle.subtract(-1)} of #{DETAILS[:item]} #{DETAILS[:location]}.\n\n"
  end

  def self.stanza1(bottle)
    "%s of %s %s, %s of %s.\n" % [ bottle.count.capitalize, DETAILS[:item], DETAILS[:location], bottle.count, DETAILS[:item] ] +
    "%s, %s of %s %s.\n\n" % [ suggestion(bottle), bottle.subtract(-1), DETAILS[:item], DETAILS[:location] ]
  end

  def self.suggestion(bottle)
    bottle.number == 0 ? SUGGESTIONS[:errand] : SUGGESTIONS[:share]
  end

end
