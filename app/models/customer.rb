class Customer < ApplicationRecord
  has_many :appointments
  has_many :services, through: :appointments
end
