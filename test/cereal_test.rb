require './test/test_helper'

class CerealTest < MiniTest::Unit::TestCase
  def setup
  end

  def test_cereal_does_nothing_by_default
    normal_user = NormalUser.new(name: 'Mickey Mouse', age: 50)
    assert_equal normal_user.attributes, normal_user.serializable_hash
  end

  def test_defaults_are_used
    user = User.new(name: 'Mickey Mouse', age: 50)
    assert_nil user.serializable_hash[:age]
  end

  def test_other_methods_can_be_used
    user = User.new(name: 'Mickey Mouse', age: 50)
    refute_nil user.serializable_hash(with: [:age_details])[:age]
  end
end
