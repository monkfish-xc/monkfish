require 'test_helper'

class SynapsesControllerTest < ActionController::TestCase
  def test_create_invalid
    Synapse.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Synapse.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to root_url
  end

  def test_destroy
    synapse = Synapse.first
    delete :destroy, :id => synapse
    assert_redirected_to root_url
    assert !Synapse.exists?(synapse.id)
  end
end
