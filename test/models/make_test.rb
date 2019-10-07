require 'test_helper'

class MakeTest < ActiveSupport::TestCase

  test "for empty name" do
    m = Make.create({:name=>""})
    refute c.valid?
    refute c.save
    assert_equal({:name=>["can't be blank"]}, c.errors.messages)
  end

end
