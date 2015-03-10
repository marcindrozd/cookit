class Category < ActiveRecord::Base
  has_many :recipe_categories
  has_many :recipes, -> { order(created_at: :desc) }, through: :recipe_categories

  def recent_recipes
    recipes.limit(5)
  end
end
