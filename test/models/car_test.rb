require 'test_helper'

class CarTest < ActiveSupport::TestCase

test "for empty vin" do
  c = Car.create({:vin => "", :make => "Make", :model=>"Model"})
  refute c.valid?
  refute c.save
  assert_equal({:vin=>["is the wrong length (should be 8 characters))"]}, c.errors.messages)
end

test "for empty make" do
  c = Car.create({:vin => "00000000", :make => "", :model=>"Model"})
  refute c.valid?
  refute c.save
  assert_equal({:make=>["can't be blank"]}, c.errors.messages)
end

test "for empty model" do
  c = Car.create({:vin => "00000000", :make => "Make", :model=>""})
  refute c.valid?
  refute c.save
  assert_equal({:model=>["can't be blank"]}, c.errors.messages)
end


end
