require 'test_helper'

class PartTest < ActiveSupport::TestCase

  test "for empty name" do
    p = Part.create({:name=>""})
    refute c.valid?
    refute c.save
    assert_equal({:name=>["can't be blank"]}, c.errors.messages)
  end

end
