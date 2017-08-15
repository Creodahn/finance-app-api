class ContactInfoType < ApplicationRecord
  validates :name, presence: true

  has_many :addresses
  has_many :phone_numbers
end
