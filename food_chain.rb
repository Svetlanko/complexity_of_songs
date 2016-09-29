require 'pry'

class Animal < Struct.new(:name, :feature) ; end

class FoodChain

  ANIMALS_AND_QUALITIES =
    {
      'horse':  [ nil, nil ],
      'cow':    [ nil, 'I don\'t know how she swallowed a cow!' ],
      'goat':   [ nil, 'Just opened her throat and swallowed a goat!' ],
      'dog':    [ nil, 'What a hog, to swallow a dog!' ],
      'cat':    [ nil, 'Imagine that, to swallow a cat!' ],
      'bird':   [ nil, 'How absurd to swallow a bird!' ],
      'spider': ['that wriggled and jiggled and tickled inside her', 'It wriggled and jiggled and tickled inside her.' ],
      'fly':    [ nil, nil ]
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
      "I know an old lady who swallowed a %s.\n" % animals.last(i).first.name +
      "%s\n"                                     % "I don't know why she swallowed the fly. Perhaps she'll die."
    when 2
      "I know an old lady who swallowed a %s.\n" % animals.last(i).first.name +
      "%s\n"                                     % "It wriggled and jiggled and tickled inside her." +
      "%s\n"                                     % chain(i) +
      "%s\n"                                     % "I don't know why she swallowed the fly. Perhaps she'll die."
    when 3
      "I know an old lady who swallowed a %s.\n" % animals.last(i).first.name +
      "%s\n"                                     % "How absurd to swallow a bird!" +
      "%s\n"                                     % chain(i) +
      "%s\n"                                     % "I don't know why she swallowed the fly. Perhaps she'll die."
    when 4
      "I know an old lady who swallowed a %s.\n" % animals.last(i).first.name +
      "%s\n"                                     % "Imagine that, to swallow a cat!" +
      "%s\n"                                     % chain(i) +
      "%s\n"                                     % "I don't know why she swallowed the fly. Perhaps she'll die."
    when 5
      "I know an old lady who swallowed a %s.\n" % animals.last(i).first.name +
      "%s\n"                                     % "What a hog, to swallow a dog!" +
      "%s\n"                                     % chain(i) +
      "%s\n"                                     % "I don't know why she swallowed the fly. Perhaps she'll die."
    when 6
      "I know an old lady who swallowed a %s.\n" % animals.last(i).first.name +
      "%s\n"                                     % "Just opened her throat and swallowed a goat!" +
      "%s\n"                                     % chain(i) +
      "%s\n"                                     % "I don't know why she swallowed the fly. Perhaps she'll die."
    when 7
      "I know an old lady who swallowed a %s.\n" % animals.last(i).first.name +
      "%s\n"                                     % "I don't know how she swallowed a cow!" +
      "%s\n"                                     % chain(i) +
      "%s\n"                                     % "I don't know why she swallowed the fly. Perhaps she'll die."
    when 8
      "I know an old lady who swallowed a %s.\n" % animals.last(i).first.name +
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