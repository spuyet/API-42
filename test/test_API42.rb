require 'minitest_helper'

class TestAPI42 < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::API42::VERSION
  end

  def test_it_does_something_useful
    assert false
  end
end
