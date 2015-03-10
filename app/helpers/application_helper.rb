module ApplicationHelper
  def available_to_add(user, recipe)
    !(user.favorites.map(&:recipe_id).include?(recipe.id) || recipe.creator == user)
  end
end
