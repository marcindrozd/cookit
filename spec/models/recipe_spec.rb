require 'spec_helper'

describe Recipe do
  it { should have_many(:categories).through(:recipe_categories) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:directions) }
  it { should validate_presence_of(:ingredients) }
  it { should belong_to(:creator) }

  describe ".search_by_title" do
    it "returns an empty array when there are no matches" do
      recipe = Fabricate(:recipe, title: "Spaghetti Carbonara")
      expect(Recipe.search_by_title("pizza")).to eq([])
    end

    it "returns an array with recipe when there is a match" do
      recipe = Fabricate(:recipe, title: "Spaghetti Carbonara")
      expect(Recipe.search_by_title("Spaghetti Carbonara")).to eq([recipe])
    end

    it "returns an array with recipe when there is a partial match" do
      recipe = Fabricate(:recipe, title: "Spaghetti Carbonara")
      expect(Recipe.search_by_title("arbo")).to eq([recipe])
    end

    it "returns array with multiple recipes when there are multiple matches ordered by created date" do
      spaghetti1 = Fabricate(:recipe, title: "Spaghetti Carbonara", created_at: 2.days.ago)
      spaghetti2 = Fabricate(:recipe, title: "Spaghetti Bolognese")
      expect(Recipe.search_by_title("spaghetti")).to eq([spaghetti2, spaghetti1])
    end

    it "returns an empty array when there is no input from the user" do
      recipe = Fabricate(:recipe, title: "Spaghetti Carbonara")
      expect(Recipe.search_by_title("")).to eq([])
    end
  end

  describe "#ingredients_list" do
    it "returns an array with one element if there is one ingredient" do
      recipe = Fabricate(:recipe, ingredients: "Eggs")
      expect(recipe.ingredients_list).to eq(["Eggs"])
    end

    it "returns an array with all elements when there are multiple ingredients" do
      recipe = Fabricate(:recipe, ingredients: "Eggs; Mayo; Grated cheese; Ham")
      expect(recipe.ingredients_list).to eq(["Eggs", "Mayo", "Grated cheese", "Ham"])
    end

    it "returns an array with all the elements when they are split by semicolon with no space" do
      recipe = Fabricate(:recipe, ingredients: "Eggs;Mayo;Grated cheese;Ham")
      expect(recipe.ingredients_list).to eq(["Eggs", "Mayo", "Grated cheese", "Ham"])
    end
  end
end
