require 'pry'

class Animal < Struct.new(:name, :feature) ; end

class FoodChain

  ANIMALS_AND_QUALITIES =
    {
      'horse':  nil,
      'cow':    nil,
      'goat':   nil,
      'dog':    nil,
      'cat':    nil,
      'bird':   nil,
      'spider': 'that wriggled and jiggled and tickled inside her',
      'fly':    nil,
    }

  attr_reader :animals

  def initialize
    @animals = ANIMALS_AND_QUALITIES.map do |pair|
      Animal.new(pair.first.to_s, pair.last)
    end
  end

  def lyrics
  	(1..8).map { |i| verse(i) }.join("\n")
  end

  private

  def verse(i)
    case i
    when 1
      "I know an old lady who swallowed a %s.\n" % "fly" +
      "%s\n"                                     % "I don't know why she swallowed the fly. Perhaps she'll die."
    when 2
      "I know an old lady who swallowed a %s.\n" % "spider" +
      "%s\n"                                     % "It wriggled and jiggled and tickled inside her." +
      "%s\n"                                     % chain(2) +
      "%s\n"                                     % "I don't know why she swallowed the fly. Perhaps she'll die."
    when 3
      "I know an old lady who swallowed a %s.\n" % "bird" +
      "%s\n"                                     % "How absurd to swallow a bird!" +
      "%s\n"                                     % chain(3) +
      "%s\n"                                     % "I don't know why she swallowed the fly. Perhaps she'll die."
    when 4
      "I know an old lady who swallowed a %s.\n" % "cat" +
      "%s\n"                                     % "Imagine that, to swallow a cat!" +
      "%s\n"                                     % chain(4) +
      "%s\n"                                     % "I don't know why she swallowed the fly. Perhaps she'll die."
    when 5
      "I know an old lady who swallowed a %s.\n" % "dog" +
      "%s\n"                                     % "What a hog, to swallow a dog!" +
      "%s\n"                                     % chain(5) +
      "%s\n"                                     % "I don't know why she swallowed the fly. Perhaps she'll die."
    when 6
      "I know an old lady who swallowed a %s.\n" % "goat" +
      "%s\n"                                     % "Just opened her throat and swallowed a goat!" +
      "%s\n"                                     % chain(6) +
      "%s\n"                                     % "I don't know why she swallowed the fly. Perhaps she'll die."
    when 7
      "I know an old lady who swallowed a %s.\n" % "cow" +
      "%s\n"                                     % "I don't know how she swallowed a cow!" +
      "%s\n"                                     % chain(7) +
      "%s\n"                                     % "I don't know why she swallowed the fly. Perhaps she'll die."
    when 8
      "I know an old lady who swallowed a %s.\n" % "horse" +
      "%s\n"                                     % "She's dead, of course!"
    end
  end

  def chain(i)
    animals.last(i).each_cons(2).map do |pair|
      motivation(*pair)
    end.join("\n")
  end

  def motivation(predator, prey)
    "She swallowed the %s to catch the %s." % [
      predator.name,
      [ prey.name, prey.feature ].compact.join(" ")  #TODO: could be potentially extracted to its own method
    ]
  end

end