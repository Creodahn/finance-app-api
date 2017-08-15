class Profile < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :name, presence: true, length: { maximum: 100 }
  validates_format_of :name, :with => /\A[^0-9`!@#\$%\^&*+_=]{4,}\z/
  validates :user, presence: true, uniqueness: true

  before_save :email_case

  belongs_to :user

  has_many :addresses
  has_many :images, as: :imageable
  has_many :groups, through: :memberships
  has_many :memberships
  has_many :phone_numbers

  def email_case
    email.downcase!
  end
end
