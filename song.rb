class Bottle

  attr_reader :number, :item

  def initialize(number)
    @number = number
    @item = self.class.name.downcase
  end

  def count
    return format('no more', items) if number == 0
    return format(number, item)     if number == 1

    format(number, items)
  end

  def subtract(value)
    return format(Song::NUMBER_OF_BOTTLES, items) if number == 0
    return format('no more', items)               if number == 1
    return format(number + value, item)           if number == 2

    format(number + value, items)
  end

  private

  def items
    item + 's'
  end

  def format(number, word)
    [ number, word ].join(' ')
  end

end

class Song

  NUMBER_OF_BOTTLES = 99

  DETAILS = { subject: 'beer', location: 'on the wall' }

  SUGGESTIONS =
    {
      share: 'Take one down and pass it around',
      errand: 'Go to the store and buy some more'
    }

  attr_reader :subject, :location

  def initialize
    @subject = DETAILS[:subject]
    @location = DETAILS[:location]
  end

  def lyrics
    (0..NUMBER_OF_BOTTLES).to_a.reverse.map do |num|
      stanza Bottle.new(num)
    end.join
  end

  private

  def stanza(bottle)
    "#{bottle.count.capitalize} of #{subject} #{location}, #{bottle.count} of #{subject}.\n" +
    "#{suggestion(bottle)}, #{bottle.subtract(-1)} of #{subject} #{location}.\n\n"
  end

  def stanza1(bottle)
    "%s of %s %s, %s of %s.\n" % [ bottle.count.capitalize, subject, location, bottle.count, subject ] +
    "%s, %s of %s %s.\n\n" % [ suggestion(bottle), bottle.subtract(-1), subject, location ]
  end

  def suggestion(bottle)
    bottle.number == 0 ? SUGGESTIONS[:errand] : SUGGESTIONS[:share]
  end

end

