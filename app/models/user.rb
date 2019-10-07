class User < ApplicationRecord
  validates_presence_of :email, :full_name, :location
  #validates_confirmation_of :password
  validates :bio, length: { maximum: 30 }, :allow_black => false
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  validates_uniqueness_of :email

  has_secure_password
end
