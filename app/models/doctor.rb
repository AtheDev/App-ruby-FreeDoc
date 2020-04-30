class Doctor < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments
  has_many :deal_with_its
  has_many :specialties, through: :deal_with_its
end
