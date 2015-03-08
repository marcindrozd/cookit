class Recipe < ActiveRecord::Base
  has_many :recipe_categories
  has_many :categories, through: :recipe_categories
  belongs_to :user

  validates_presence_of :title, :directions, :ingredients

  def self.search_by_title(search_title)
    return [] if search_title.blank?
    where("lower(title) like ?", "%#{search_title.downcase}%").order(created_at: :desc)
  end

  def ingredients_list
    ingredients.split(";").map(&:strip)
  end
end
