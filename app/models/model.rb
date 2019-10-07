class Model < ApplicationRecord
  belongs_to :make

  validates :name, :make, presence: true
end
