class RecipesController < ApplicationController
  def index
    @categories = Category.all
  end

  def search
    @recipes = Recipe.search_by_title(params[:recipe])
  end
end
