class Doctor < ApplicationRecord
  has_one :location
  has_many :patients
end
