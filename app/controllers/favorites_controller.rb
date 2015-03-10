class FavoritesController < ApplicationController
  before_action :require_user

  def create
    recipe = Recipe.find(params[:recipe_id])
    unless recipe_already_in_favorites(recipe) || recipe.creator == current_user
      Favorite.create(recipe: recipe, user: current_user)
    end

    redirect_to current_user
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy if @favorite.user == current_user
    redirect_to current_user
  end

  private

  def recipe_already_in_favorites(recipe)
    current_user.favorites.map(&:recipe_id).include?(recipe.id)
  end
end
