class House

  DATA = 
  [
  	'the horse and the hound and the horn that belonged to',
    'the farmer sowing his corn that kept',
    'the rooster that crowed in the morn that woke',
    'the priest all shaven and shorn that married',
    'the man all tattered and torn that kissed',
    'the maiden all forlorn that milked',
    'the cow with the crumpled horn that tossed',
    'the dog that worried',
    'the cat that killed',
    'the rat that ate',
    'the malt that lay in',
    'the house that Jack built'
  ]

  attr_reader :pieces

  def initialize(ordered)
    @pieces = ordered.order(DATA)
  end

  def recite
  	(1..pieces.length).map { |i| line(i) }.join("\n")
  end

  def line(number)
  	"This is #{phrase(number)}.\n"
  end

  private 

  def phrase(number)
    pieces.last(number).join(' ')
  end

end


class Controller
  
  def play_house(choice = nil)
    House.new(Order.new(choice)).line(12)
  end

end


module Order

  def self.new(choice)
    const_get(
      (choice || 'default').to_s.split('_').map(&:capitalize).join
    ).new
  end

  class Default
    def order(data)
      data
    end
  end

  class Random
    def order(data)
      data.shuffle
    end
  end

  class MostlyRandom
    def order(data)
      data[0..-1].shuffle << data[-1]
    end
  end

end


puts "\n--- random is false ---\n" + Controller.new.play_house

puts "\n--- random ---\n" + Controller.new.play_house(:random)

puts "\n--- :mostly_random ---\n" + Controller.new.play_house(:mostly_random)


