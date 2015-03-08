class User < ActiveRecord::Base
  has_many :recipes
  has_secure_password

  validates_presence_of :full_name, :email_address, :password
  validates_uniqueness_of :email_address
end
