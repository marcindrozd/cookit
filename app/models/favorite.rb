class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe

  def recipe_title
    recipe.title
  end
end
