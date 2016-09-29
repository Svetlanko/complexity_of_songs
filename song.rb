class Song

  NUMBER_OF_BOTTLES = 99
  DATA =
      { bottles: 'bottles of beer',
        bottle: 'bottle of beer',
        where: 'on the wall',
        action: 'Take one down and pass it around',
        chore: 'Go to the store and buy some more'
      }

  def self.lyrics
    (0..NUMBER_OF_BOTTLES).to_a.reverse.map do |num|
      stanza num
    end.join
  end

  private

  def self.stanza(number)
    if number == 0
      "%s %s %s, %s %s.\n" % [ 'No more', DATA[:bottles], DATA[:where], 'no more', DATA[:bottles]] +
      "%s, %s %s %s.\n" % [ DATA[:chore], NUMBER_OF_BOTTLES, DATA[:bottles], DATA[:where]]
    elsif number == 1
      "%s %s %s, %s %s.\n" % [ number, DATA[:bottle], DATA[:where], number, DATA[:bottle] ] +
      "%s, %s %s %s.\n" % [ DATA[:action], 'no more', DATA[:bottles], DATA[:where] ] +
      "\n"
    elsif number == 2
      "%s %s %s, %s %s.\n" % [ number, DATA[:bottles], DATA[:where], number, DATA[:bottles] ] +
      "%s, %s %s %s.\n" % [ DATA[:action], number - 1, DATA[:bottle], DATA[:where] ] +
      "\n"
    else
      "%s %s %s, %s %s.\n" % [ number, DATA[:bottles], DATA[:where], number, DATA[:bottles] ] +
      "%s, %s %s %s.\n" % [ DATA[:action], number - 1, DATA[:bottles], DATA[:where] ] +
      "\n"
    end
  end

end
