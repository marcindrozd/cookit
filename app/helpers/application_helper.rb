module ApplicationHelper
  def show_image(recipe)
    if recipe.picture_url
      recipe.picture
    else
      'cooking_standard.jpg'
    end
  end
end
