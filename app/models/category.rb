class Category < ActiveRecord::Base
  has_many :recipe_categories
  has_many :recipes, through: :recipe_categories

  def recent_recipes
    recipes.limit(5).order(created_at: :desc)
  end
end
