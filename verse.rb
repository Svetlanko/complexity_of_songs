class Verse

  attr_reader :animals, :i

  def initialize(animals)
    @animals = animals
    @i = animals.count
  end

  def build
    case i
      when 1
        "I know an old lady who swallowed a %s.\n" % animals.last(i).first.name +
        "%s\n"                                     % animals.last(i).first.aside
      when 8
        "I know an old lady who swallowed a %s.\n" % animals.last(i).first.name +
        "%s\n"                                     % animals.last(i).first.aside
      else
        "I know an old lady who swallowed a %s.\n" % animals.last(i).first.name +
        "%s\n"                                     % animals.last(i).first.aside +
        "%s"                                       % summary
    end
  end

  private

  def summary
   "%s\n" % chain +
   "%s\n" % "I don't know why she swallowed the fly. Perhaps she'll die."
  end

  def incident
    "I know an old lady who swallowed a %s.\n%s\n" % [
      animals.last(i).first.name,
      animals.last(i).first.aside
    ]
  end

  def chain
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