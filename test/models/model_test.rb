require 'test_helper'

class ModelTest < ActiveSupport::TestCase

  test "for empty name" do
    m = Model.create({:name=>""})
    refute c.valid?
    refute c.save
    assert_equal({:name=>["can't be blank"]}, c.errors.messages)
  end

end
