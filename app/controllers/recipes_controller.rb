class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :require_creator, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all.order(:name)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.creator = current_user

    if @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  end

  def search
    @recipes = Recipe.search_by_title(params[:recipe])
  end

  def show
  end

  def edit
  end

  def destroy
    @recipe.destroy
    redirect_to current_user
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render :edit
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :directions, :ingredients, category_ids:[])
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def require_creator
    display_error unless can_edit?(@recipe)
  end
end
