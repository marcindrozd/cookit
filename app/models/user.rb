class User < ActiveRecord::Base
  has_many :recipes
  has_many :favorites
  has_secure_password

  validates_presence_of :full_name, :email_address, :password
  validates_uniqueness_of :email_address

  def can_add?(recipe)
    !(favorites.map(&:recipe_id).include?(recipe.id) || self == recipe.creator)
  end
end
