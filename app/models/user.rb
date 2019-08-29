class User < ApplicationRecord
  attr_accessor :bio, :email, :full_name, :location, :password
  validates_presence_of :email, :full_name, :location, :password
  validates_confirmation_of :password
  validate_length_of :bio, minimum => 30, :allow_black => false
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  validates_uniqueness_of :email

end
