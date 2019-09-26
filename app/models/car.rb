class Car < ApplicationRecord
  belongs_to :make
  belongs_to :model
  has_and_belongs_to_many :parts
end
