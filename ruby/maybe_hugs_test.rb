require 'minitest/autorun'
require_relative './maybe_hugs'

# Ensure cuties get hugs
class TestMaybeHugs < Minitest::Test
  # A huggable cutie
  class Cutie
    def hug
      'HUG!'
    end
  end

  # A non-huggleable cutie
  class NoHugs
  end

  def setup
    @huggable_cutie = Cutie.new
    @empathy_cutie = NoHugs.new
  end

  def test_cuties_get_hugs
    maybe = MaybeHug.new(@huggable_cutie)
    assert_equal 'HUG!', maybe.hug
  end

  def test_cuties_get_empathy
    maybe = MaybeHug.new(@empathy_cutie)
    assert_equal 'Cutie prefers empathy!', maybe.hug
  end
end
