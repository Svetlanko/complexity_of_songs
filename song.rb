require 'pry'

class Bottle

  attr_reader :number
  attr_accessor :item

  def initialize(number)
    @number = number
    @item = self.class.name.downcase
  end

  def count
    if number == 1
      [ number, item ]
    elsif number == 0
      [ 'no more', item + 's' ]
    else
      [ number, item + 's']
    end.join(' ')
  end

  def subtract(value)
    if number == 1
      [ 'no more', item + 's']
    elsif number == 2
      [ number + value, item ]
    elsif number == 0
      [ 99, item + 's']
    else
      [ number + value, item + 's' ]
    end.join(' ')
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
    (0..NUMBER_OF_BOTTLES).to_a.reverse.map do |num|
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
