require 'pry'

class Song
  
  ANIMALS = %w(fly spider bird cat dog goat cow horse)

  def lyrics
  	text = []

  	ANIMALS.map do |animal|
  	  text << first_row % animal
  	  	
  	  case animal
  	  when 'fly'
  	  	text << chorus
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
  	  	text << 'I don\'t know how she swallowed a animal!' % animal
  	  	text << recite(animal)
        text << chorus
  	  when 'horse'
  	  	text << the_end
  	  end
  	end
  end

  def recite(animal)
    animal_pairs = swallowed_order animal
    animal_pairs.map do |pair|
      swallowed(*pair) unless pair.any?(&:nil?)
    end
  end

  def swallowed_order(animal)
    animals = ANIMALS.reverse
  	swallowed_animals = animals[animals.index(animal)..-1]
  	swallowed_animals.zip(swallowed_animals[1..-1]).reject { |pair| pair.include? nil }
  end

  def swallowed(animal1, animal2)
  	'She swallowed the %s to catch the %s' % [ animal1, animal2 ]
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
    puts lyrics.join("\n")
  end

end

Song.new.print