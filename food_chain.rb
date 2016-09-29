require 'pry'
require_relative 'verse'

class Animal < Struct.new(:name, :feature, :aside); end

class FoodChain

  ANIMALS_AND_QUALITIES =
    {
      'horse':  [ nil, 'She\'s dead, of course!' ],
      'cow':    [ nil, 'I don\'t know how she swallowed a cow!' ],
      'goat':   [ nil, 'Just opened her throat and swallowed a goat!' ],
      'dog':    [ nil, 'What a hog, to swallow a dog!' ],
      'cat':    [ nil, 'Imagine that, to swallow a cat!' ],
      'bird':   [ nil, 'How absurd to swallow a bird!' ],
      'spider': ['that wriggled and jiggled and tickled inside her', 'It wriggled and jiggled and tickled inside her.' ],
      'fly':    [ nil, 'I don\'t know why she swallowed the fly. Perhaps she\'ll die.' ]
    }

  NUMBER_OF_ANIMALS = ANIMALS_AND_QUALITIES.count

  attr_reader :animals

  def initialize
    @animals = ANIMALS_AND_QUALITIES.map do |pair|
      Animal.new(pair.first.to_s, *pair.last)
    end
  end

  def lyrics
  	(1..NUMBER_OF_ANIMALS).map { |i|
      Verse.new(animals.last(i)).build
    }.join("\n")
  end

end