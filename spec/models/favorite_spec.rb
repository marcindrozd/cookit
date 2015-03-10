require 'spec_helper'

describe Favorite do
  it { should belong_to(:user) }
  it { should belong_to(:recipe) }

  describe "#recipe_title" do
    it "return the title of the recipe" do
      recipe = Fabricate(:recipe, title: "Pizza")
      favorite = Fabricate(:favorite, recipe: recipe)
      expect(favorite.recipe_title).to eq("Pizza")
    end
  end
end
