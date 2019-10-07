class Car < ApplicationRecord
  belongs_to :make
  belongs_to :model
  has_and_belongs_to_many :parts

  validates :make, :model, presence: true
  validates :vin, uniqueness:true, length: {is: 8}
end
