# Maybe hug a cutie
class MaybeHug
  attr_reader :cutie

  def initialize(cutie)
    @cutie = cutie
  end

  def hug
    if cutie.respond_to? :hug
      cutie.hug
    else
      'Cutie prefers empathy!'
    end
  end
end
