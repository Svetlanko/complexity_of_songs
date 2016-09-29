class Verse

  attr_reader :animals, :length

  def initialize(animals)
    @animals = animals
    @length = animals.length
  end

  def build
    incident + summary
  end

  private

  def summary
    case length
      when 1, 8
        ""
      else
        "%s\n%s\n" % [ chain, animals.last.aside ]
    end
  end

  def incident
    "I know an old lady who swallowed a %s.\n%s\n" % [
      animals.first.name,
      animals.first.aside
    ]
  end

  def chain
    animals.each_cons(2).map do |pair|
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