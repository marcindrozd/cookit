class RecipesController < ApplicationController
  def index
    @categories = Category.all
  end
end
