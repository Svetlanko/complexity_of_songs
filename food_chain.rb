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
        text << swallowed('spider', 'fly')
  	  	text << chorus
  	  when 'bird'
  	  	text << 'How absurd to swallow a %s!' % animal
        text << swallowed('bird', 'spider that wriggled and jiggled and tickled inside her.')
        text << swallowed('spider', 'fly')
  	    text << chorus
  	  when 'cat'
  	  	text << 'Imagine that, to swallow a %s!' % animal
        text << swallowed('cat', 'bird')
        text << swallowed('bird', 'spider that wriggled and jiggled and tickled inside her.')
        text << swallowed('spider', 'fly')
  	    text << chorus
  	  when 'dog'
  	  	text << 'What a hog, to swallow a %s!' % animal
        text << swallowed('dog', 'cat')
        text << swallowed('cat', 'bird')
        text << swallowed('bird', 'spider that wriggled and jiggled and tickled inside her.')
        text << swallowed('spider', 'fly')
        text << chorus
  	  when 'goat'
  	  	text << 'Just opened her throat and swallowed a %s!' % animal
        text << swallowed('goat', 'dog')
        text << swallowed('dog', 'cat')
        text << swallowed('cat', 'bird')
        text << swallowed('bird', 'spider that wriggled and jiggled and tickled inside her.')
        text << swallowed('spider', 'fly')
        text << chorus
  	  when 'cow' 
  	  	text << 'I don\'t know how she swallowed a animal!' % animal
  	  	text << swallowed('cow', 'goat')
        text << swallowed('goat', 'dog')
        text << swallowed('dog', 'cat')
        text << swallowed('cat', 'bird')
        text << swallowed('bird', 'spider that wriggled and jiggled and tickled inside her.')
        text << swallowed('spider', 'fly')
        text << chorus
  	  when 'horse'
  	  	text << the_end
  	  end	
  	end
  end

  def swallowed(animal1, animal2)
  	'She swallowed the %s to catch the %s' % [ animal1, animal2 ]
  end

  def first_row
  	"I know an old lady who swallowed a %s."
  end

  def chorus
  	"I don't know why she swallowed the fly. Perhaps she'll die."
  end

  def the_end
  	'She\'s dead, of course!'
  end

  def print
    puts lyrics.join("\n")
  end

end

Song.new.print