require 'test_helper'

class SynapseTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Synapse.new.valid?
  end
end
