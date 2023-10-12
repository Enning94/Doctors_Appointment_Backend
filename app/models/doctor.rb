class Doctor < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :users, through: :appointments

  validates :name, presence: true, length: { maximum: 200 }
  validates :profile_pic, presence: true
  validates :bio, presence: true, length: { maximum: 1000 }
  validates :specialization, presence: true, length: { maximum: 100 }
  validates :consultation_fee, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
