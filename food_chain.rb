require 'pry'

class FoodChain
  
  ANIMAL_AND_QUALITIES = 
    {
      'fly': '',
      'spider': ' that wriggled and jiggled and tickled inside her',
      'bird': '',
      'cat': '',
      'dog': '',
      'goat': '',
      'cow': '',
      'horse': ''
    }
  
  ANIMALS = ANIMAL_AND_QUALITIES.keys.map(&:to_s)

  def lyrics
  	text = []

  	ANIMALS.each do |animal|
  	  text << first_row % animal
  	  text << chorus if animal == 'fly'
  	  text << the_end if animal == 'horse'

  	  case animal
  	  when 'spider'
  	  	text << 'It wriggled and jiggled and tickled inside her.'
  	  	text << recite(animal)
  	  	text << chorus
  	  when 'bird'
  	  	text << 'How absurd to swallow a %s!' % animal
  	  	text << recite(animal)
  	    text << chorus
  	  when 'cat'
  	  	text << 'Imagine that, to swallow a %s!' % animal
  	  	text << recite(animal)
  	    text << chorus
  	  when 'dog'
  	  	text << 'What a hog, to swallow a %s!' % animal
  	  	text << recite(animal)
        text << chorus
  	  when 'goat'
  	  	text << 'Just opened her throat and swallowed a %s!' % animal
  	  	text << recite(animal)
        text << chorus
  	  when 'cow' 
  	  	text << 'I don\'t know how she swallowed a %s!' % animal
  	  	text << recite(animal)
        text << chorus
  	  end
  	end
  	text
  end

  def recite(animal)
    animal_pairs = swallowed_order animal
    animal_pairs.map do |pair|
      swallowed(*pair)
    end
  end

  def swallowed_order(animal)
    animals = ANIMALS.reverse
  	swallowed_animals = animals[animals.index(animal)..-1]
  	swallowed_animals.zip(swallowed_animals[1..-1]).reject { |pair| pair.include? nil }
  end

  def swallowed(animal1, animal2)
  	if animal2 == 'spider' 
       animal2 += ANIMAL_AND_QUALITIES[animal2.to_sym]
    end
    'She swallowed the %s to catch the %s.' % [ animal1, animal2 ]
  end

  def first_row
  	"I know an old lady who swallowed a %s."
  end

  def chorus
  	"I don't know why she swallowed the fly. Perhaps she'll die.\n"
  end

  def the_end
  	'She\'s dead, of course!'
  end

  def print
    lyrics.join("\n")
  end

end
