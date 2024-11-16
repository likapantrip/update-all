class Student < ApplicationRecord
  validates :name, presence: true
  validates :age,  presence: true,  numericality: true
end
